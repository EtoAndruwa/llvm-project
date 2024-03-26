#include "mlir/Dialect/EmitC/IR/EmitC.h"
#include "mlir/Dialect/EmitC/Transforms/Passes.h"
#include "mlir/Dialect/EmitC/Transforms/Transforms.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"
#include <iostream>

namespace mlir 
{
  namespace emitc 
  {
    #define GEN_PASS_DEF_DIVTOOUTERFUNC
    #include "mlir/Dialect/EmitC/Transforms/Passes.h.inc"
  } // namespace emitc
} // namespace mlir

using namespace mlir;
using namespace emitc;

namespace 
{
  // this is struct for my pass 
  struct DivToOuterFuncPass: public emitc::impl::DivToOuterFuncBase<DivToOuterFuncPass> 
  {
    void runOnOperation() override 
    {
      MLIRContext* context = &getContext();
      Operation* rootOp = getOperation();
      module_ptr = rootOp; // saving module ptr in the class's field

      reg_ptr = &(module_ptr->getRegion(0));
      total_block_num = countBlocksInRegion(reg_ptr);
      size_t block_shift = 0;
      reg_ptr->viewGraph();

      // llvm::outs() << *module_ptr << "\n\n";

      // check_regions(context, reg_ptr, nullptr);

      // llvm::outs() << *module_ptr << "\n\n";


      // reg_ptr->viewGraph();

      bool transformed = false;
      while (!transformed)
      {
        transformed = check_regions(context, reg_ptr, nullptr, block_shift);
        if (transformed)
        {
          ++block_shift;
        }
      }
      reg_ptr->viewGraph();
    }

    public:
      typedef enum class op_types
      {
        INT,
        FLOAT,
        OPAQUE,
      }op_types;

      // typedef enum class error_code
      // {
      //   OPAQUE_VAL = -1,
      // }error_code;

    // private methods section
    private:
    
      // checks the operation
      bool check_operation(MLIRContext* context, Region* region, Block* block, Operation* op, const size_t& block_shift)
      {
        if (op == nullptr)
        {
          return false;
        }

        static llvm::StringRef div_strref = "emitc.div";
        auto cur_op_name = op->getName().getStringRef();

        if (cur_op_name == div_strref)
        {
          llvm::outs() << op->getName().getStringRef() << "\n";
          Region& reg = module_ptr->getRegion(0); // getting the first region in the module
          OpBuilder wrapper_builder(reg); // settign the builder for that region (ALWAYS!!! to the start of the region)

          std::vector<Type> return_types  = getReturnTypes(op); // getting string like 'i32'
          std::vector<Type> operand_types = getOperandTypes(op); // getting string like 'i32'

          SmallVector<Type> argTypes; // for types built by builder
          SmallVector<Type> retTypes; // for types built by builder
          build_op_types(argTypes, operand_types, wrapper_builder); // setting types of args from strings
          build_op_types(retTypes, return_types, wrapper_builder); // setting types of ret from strings

          FuncOp funcOp = create_div_wrapper(context, wrapper_builder, argTypes, retTypes); // creates the emitc.div wrapper

          OpBuilder callOp_builder(op);
          Operation* callOp = callOp_builder.create<emitc::CallOp>(callOp_builder.getUnknownLoc(), funcOp, ArrayRef<Value>{op->getOperand(0), op->getOperand(1)}); // creates the callOp
          
          replaceFunctionUses(op, callOp);
          // replace_div_by_call(op, callOp);

          // for (auto &use : op->getUses()) 
          // {
          //   use.getOwner()->dropAllReferences();
          // }
          //reg.viewGraph();
          // op->dropAllReferences();
          op->erase();
          // op = callOp;
          ++cur_func_num;
          //reg.viewGraph();
          return true;
        }
        else 
        {
          return check_ops_regions(context, region, block, op, block_shift);
        }
      }

      // iterates on all regions in the operation
      bool check_ops_regions(MLIRContext* context, Region* region, Block* block, Operation* op, const size_t& block_shift)
      {
        if (op != nullptr)
        {
          for (Region &region_it: op->getRegions())
          {
            if (check_regions(context, &region_it, block, block_shift))
            {
              return true;
            }
          }
          return false;
        }
        else 
        {
          llvm::outs() << "op is nullptr" << op;
          return false;
        }
      }

      // iterates on all blocks in the region
      bool check_regions(MLIRContext* context, Region* region, Block* block, const size_t& block_shift)
      {
        if (region != nullptr)
        {
          if (block_shift == 0)
          {
            for (Block &block_it: region->getBlocks())
            {
              if(check_blocks(context, region, &block_it, 0))
              {
                return true;
              }
            }
            return false;
          }
          else 
          {
            size_t cur_block = 0;
            for (Block &block_it: region->getBlocks())
            {
              if (cur_block != block_shift)
              {
                ++cur_block;
                continue;
              }
              else 
              {
                if(check_blocks(context, region, &block_it, 0))
                {
                  return true;
                }
              }
            }
            return false;
          }
        }
        else 
        {
          llvm::outs() << "region is nullptr" << region;
          return false;
        }
      }

      // iterates on all operation in the block
      bool check_blocks(MLIRContext* context, Region* region, Block* block, const size_t& block_shift)
      {
        if (block != nullptr)
        {
          for (Operation &op_it: block->getOperations())
          {
            if (check_operation(context, region, block, &op_it, block_shift))
            {
              ++cur_changed_block;
              return true;
            }
          }
        }
        else 
        {
          llvm::outs() << "block is nullptr" << block;
          return false;
        }
      }

      size_t countBlocksInRegion(Region* region) 
      {
        size_t count = 0;
        for (Block &block : region->getBlocks()) 
        {
            count++;
        }
        return count;
      }

      // return the vector for returns' types
      std::vector<Type> getReturnTypes(Operation* op) 
      {
          std::vector<Type> returnTypes;
          for (Type resultType: op->getResultTypes()) 
          {
            returnTypes.push_back(resultType);
          }
          return returnTypes;
      }

      // return the vector for operands' types
      std::vector<Type> getOperandTypes(Operation* op) 
      {
          std::vector<Type> operandTypes;
          for (Type operandType: op->getOperandTypes()) 
          {
            operandTypes.push_back(operandType);
          }
          return operandTypes;
      }

      void replaceFunctionUses(Operation* oldFunc, Operation* newFunc) 
      {
        for (auto &use : oldFunc->getUses()) 
        {
            use.getOwner()->replaceUsesOfWith(oldFunc, newFunc);
        }
      }

      void replace_div_by_call(Operation* op, Operation* callOp)
      {
          Value op_ret_val = op->getResult(0);
          Value callOp_ret_val = callOp->getResult(0);
          for (Operation *userOp : op_ret_val.getUsers()) 
          {
            userOp->replaceUsesOfWith(op_ret_val, callOp_ret_val);
          }
      }

      // creates the wrapped emitc.div func
      FuncOp create_div_wrapper(MLIRContext* context, OpBuilder& builder, SmallVector<Type>& argTypes, SmallVector<Type>& retTypes)
      {    
        FunctionType funcType = builder.getFunctionType({argTypes}, {retTypes}); 
        FuncOp funcOp = builder.create<FuncOp>(builder.getUnknownLoc(), func_name + std::to_string(cur_func_num), funcType);

        Block* entryBlock = funcOp.addEntryBlock();
        OpBuilder entryBlock_builder(entryBlock, entryBlock->begin()); // setting builder to the func's entry block

        Value arg1 = entryBlock->getArgument(0); // getting first arg
        Value arg2 = entryBlock->getArgument(1); // getting second arg 

        Value divResult = entryBlock_builder.create<DivOp>(entryBlock_builder.getUnknownLoc(), retTypes[0], arg1, arg2);
        entryBlock_builder.create<emitc::ReturnOp>(entryBlock_builder.getUnknownLoc(), Value{divResult});

        return funcOp;
      }

      // prints the types of returms/operand values (DEBUG ONLY)  
      void print_types(std::vector<Type>& op_types)
      {
        for (Type op_type : op_types) 
        {
          llvm::outs() << "Type: " << op_type << "\n";
        }
      }

      // gets the lenght of the int/float (32-bit, 64-bit or etc.)
      int get_bit_length(std::vector<Type>& operand_types, size_t operand_index)
      {
        for (size_t j = 8; j <= 64; j *= 2)
        {
          if (operand_types[operand_index].isa<IntegerType>() && operand_types[operand_index].cast<IntegerType>().getWidth() == j)
          {
            return j;
          }
        }

        for (size_t j = 32; j <= 64; j *= 2)
        {
          if (operand_types[operand_index].isa<FloatType>() && operand_types[operand_index].cast<FloatType>().getWidth() == j)
          {
            return j;
          }
        }
        // return error_code::OPAQUE_VAL;
      }

      // creates the types of operands using builder.get...()
      void build_op_types(SmallVector<Type>& dest_vec, std::vector<Type>& src_vec, OpBuilder& builder)
      {
        for (size_t i = 0; i < src_vec.size(); ++i)
        {
          switch (get_operand_type(src_vec, i))
          {
          case op_types::INT:
            dest_vec.push_back(builder.getIntegerType(get_bit_length(src_vec, i)));
            break;
          case op_types::FLOAT:
            if (get_bit_length(src_vec, i) == 32)
            {
              dest_vec.push_back(builder.getF32Type());
            }
            else 
            {
              dest_vec.push_back(builder.getF64Type());
            }
            break;
          // case op_types::OPAQUE:
          //   // argTypes.push_back(builder.getOpaque());
          //   break;
          default:
            break;
          }
        }
      }

      // gets the operands types (INT, FLOAT, OPAQUE)
      op_types get_operand_type(std::vector<Type>& src_vec, size_t val_index)
      {
        for (size_t j = 8; j <= 64; j *= 2)
        {
          if (src_vec[val_index].isa<IntegerType>())
          {
            return op_types::INT;
          }
        }

        for (size_t j = 32; j <= 64; j *= 2)
        {
          if (src_vec[val_index].isa<FloatType>())
          {
            return op_types::FLOAT;
          }
        }

        // HERE MUST BE OPAQUE
      }
      
      void getDependentDialects(DialectRegistry& registry) const override 
      {
        registry.insert<emitc::EmitCDialect>();
      }

      // prints the debugging info to the treminal (DEBUG ONLY)  
      void print_debug_data()
      {
        llvm::raw_ostream &outs = llvm::outs(); // the ref to the terminal output 

        outs << "\n=================================DEBUG=================================\n";
        outs << "The total number of created funcs = " << cur_func_num << "\n";
        outs << "=================================DEBUG=================================\n";
      }

      // prints op's names (DEBUG ONLY)  
      void print_op_names(Operation* const op)  
      {
        static size_t op_number = 0;
        llvm::outs () << "=========================OP_" << op_number << "=========================\n";
        llvm::outs () << "Operation name: " << op->getName() << "\n";  
        llvm::outs () << "=========================OP_" << op_number << "=========================\n\n";
        ++op_number;
      }

    // private variables section
    private:
      std::string func_name    = "wrapped_div_func";
      Operation* module_ptr    = nullptr;
      Region* reg_ptr          = nullptr;
      size_t total_block_num  = 0;
      size_t cur_changed_block  = 0; 
      size_t cur_func_num      = 0;    // stores total number of created function in order to create lables
  }; 
} // namespace

// Creates an instance of the C-style expressions forming pass.
// Exposes this pass to the outside world.
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}
