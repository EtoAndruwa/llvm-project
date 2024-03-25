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
    
      Region& reg = module_ptr->getRegion(0);

      check_operation(context, nullptr, nullptr, rootOp);
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
      void check_operation(MLIRContext* context, Region* region, Block* block, Operation* op)
      {
        llvm::StringRef div_strref = "emitc.div";
        auto cur_op_name = op->getName().getStringRef();

        if (cur_op_name == div_strref)
        {
          llvm::outs() << op->getName().getStringRef();
          // here we must get all operands and their types

          std::vector<Type> return_types  = getReturnTypes(op);
          std::vector<Type> operand_types = getOperandTypes(op);

          // here we must get everything for func creation

          Region& reg = module_ptr->getRegion(0); // getting the first region in the module
          OpBuilder reg_builder(reg);

          create_div_wrapper(context, reg_builder, operand_types, return_types);

          // settting builder
          // Type i32Type = IntegerType::get(context, 32);
          // Attribute intAttr = IntegerAttr::get(IntegerType::get(context, 32), 42);
          // OpBuilder builder(op);

          // // creating constOp value
          // Value arg1 = builder.create<ConstantOp>(builder.getUnknownLoc(), i32Type, intAttr);
          // Value arg2 = builder.create<ConstantOp>(builder.getUnknownLoc(), i32Type, intAttr);

          // // gettin the return value of emitc.div
          // Value returnValue = op->getResult(0);

          // SmallVector<Type> argTypes; 
          // SmallVector<Type> retTypes; 
          // build_op_types(argTypes, operand_types, builder); // setting types of args from strings
          // build_op_types(retTypes, return_types, builder); // setting types of ret from strings

          // Value mulRes = builder.create<MulOp>(builder.getUnknownLoc(), retTypes[0], arg1, arg2);

          // for (Operation *userOp : returnValue.getUsers()) 
          // {
          //   userOp->replaceUsesOfWith(returnValue, mulRes);
          // }


          // // llvm::outs() << op->getName().getStringRef();

          // // op->remove();
          ++cur_func_num;
          // // op = mulRes.getDefiningOp();
          // // check_ops_regions(context, region, block, op);
          // // return true;
        }

        check_ops_regions(context, region, block, op); // result of inner logic
        // return false;
      }

      // iterates on all regions in the operation
      void check_ops_regions(MLIRContext* context, Region* region, Block* block, Operation* op)
      {
        for (Region &region_it: op->getRegions())
        {
          check_regions(context, &region_it, block);
        }
      }

      // iterates on all blocks in the region
      void check_regions(MLIRContext* context, Region* region, Block* block)
      {
        for (Block &block_it: region->getBlocks())
        {
          check_blocks(context, region, &block_it);
        }
      }

      // iterates on all operation in the block
      void check_blocks(MLIRContext* context, Region* region, Block* block)
      {
        for (Operation &op_it: block->getOperations())
        {
          check_operation(context, region, block, &op_it);
          // if (check_operation(context, region, block, &op_it))
          // {
          //   // check_blocks(context, region, block);
          //   // break;
          // }
        }
      }

      // return the vector for returns' types
      std::vector<Type> getReturnTypes(Operation *op) 
      {
          std::vector<Type> returnTypes;
          for (Type resultType: op->getResultTypes()) 
          {
            returnTypes.push_back(resultType);
          }
          return returnTypes;
      }

      // return the vector for operands' types
      std::vector<Type> getOperandTypes(Operation *op) 
      {
          std::vector<Type> operandTypes;
          for (Type operandType: op->getOperandTypes()) 
          {
            operandTypes.push_back(operandType);
          }
          return operandTypes;
      }

      // creates the wrapped emitc.div func
      void create_div_wrapper(MLIRContext* context, OpBuilder& builder, std::vector<Type>& operand_types, std::vector<Type>& return_types)
      {    
        SmallVector<Type> argTypes; 
        SmallVector<Type> retTypes; 
        build_op_types(argTypes, operand_types, builder); // setting types of args from strings
        build_op_types(retTypes, return_types, builder); // setting types of ret from strings

        FunctionType funcType = builder.getFunctionType({argTypes}, {retTypes}); 
        FuncOp funcOp = builder.create<FuncOp>(builder.getUnknownLoc(), func_name + std::to_string(cur_func_num), funcType);

        Block* entryBlock = funcOp.addEntryBlock();
        OpBuilder entryBlock_builder(entryBlock, entryBlock->begin()); // setting builder to the func's entry block

        Value arg1 = entryBlock->getArgument(0); // getting first arg
        Value arg2 = entryBlock->getArgument(1); // getting second arg 

        Value divResult = entryBlock_builder.create<DivOp>(entryBlock_builder.getUnknownLoc(), retTypes[0], arg1, arg2);
        entryBlock_builder.create<emitc::ReturnOp>(entryBlock_builder.getUnknownLoc(), Value{divResult});
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
      
      void getDependentDialects(DialectRegistry &registry) const override 
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
      Region* first_module_reg = nullptr;
      size_t cur_func_num      = 0;    // stores total number of created function in order to create lables
  }; 
} // namespace

// Creates an instance of the C-style expressions forming pass.
// Exposes this pass to the outside world.
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}
