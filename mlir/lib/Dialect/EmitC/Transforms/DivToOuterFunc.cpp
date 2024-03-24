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
      // reg.viewGraph();
      check_operation(context, nullptr, nullptr, rootOp);
      // reg.viewGraph();
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
          // here we must get all operands and their types

          std::vector<Type> return_types  = getReturnTypes(op);
          std::vector<Type> operand_types = getOperandTypes(op);

          // here we must get everything for func creation

          Region& reg = module_ptr->getRegion(0); // getting the first region in the module
          OpBuilder reg_builder(reg);

          create_div_wrapper(context, reg_builder, operand_types, return_types);
        
          // here we must delete move/delete or something with emitc.div

          // here we must call function 

          ++cur_func_num;
        }

          check_ops_regions(context, region, block, op);
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

      void create_div_wrapper(MLIRContext* context, OpBuilder& builder, std::vector<Type>& operand_types, std::vector<Type>& return_types)
      {    
        SmallVector<Type> argTypes; 
        SmallVector<Type> retTypes; 
        build_op_types(argTypes, operand_types, builder);
        build_op_types(retTypes, return_types, builder);

        FunctionType funcType = builder.getFunctionType({argTypes}, {retTypes}); // here we must specify types 
        FuncOp funcOp = builder.create<FuncOp>(builder.getUnknownLoc(), func_name + std::to_string(cur_func_num), funcType);

        Block* entryBlock = funcOp.addEntryBlock();
        OpBuilder entryBlock_builder(entryBlock, entryBlock->begin());

        Value arg1 = entryBlock->getArgument(0);
        Value arg2 = entryBlock->getArgument(1);
        
        // here is the problem with div func
        // Value divResult = entryBlock_builder.create<DivOp>(entryBlock_builder.getUnknownLoc(), retTypes[0], arg1, arg2);
        // entryBlock_builder.create<emitc::ReturnOp>(entryBlock_builder.getUnknownLoc(), Value{divResult});
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
      void build_op_types(SmallVector<Type>& argTypes, std::vector<Type>& operand_types, OpBuilder& builder)
      {
        for (size_t i = 0; i < 2; ++i)
        {
          switch (get_operand_type(operand_types, i))
          {
          case op_types::INT:
            argTypes.push_back(builder.getIntegerType(get_bit_length(operand_types, i)));
            break;
          case op_types::FLOAT:
            if (get_bit_length(operand_types, i) == 32)
            {
              argTypes.push_back(builder.getF32Type());
            }
            else 
            {
              argTypes.push_back(builder.getF64Type());
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
      op_types get_operand_type(std::vector<Type>& operand_types, size_t operand_index)
      {
        for (size_t j = 8; j <= 64; j *= 2)
        {
          if (operand_types[operand_index].isa<IntegerType>())
          {
            return op_types::INT;
          }
        }

        for (size_t j = 32; j <= 64; j *= 2)
        {
          if (operand_types[operand_index].isa<FloatType>())
          {
            return op_types::FLOAT;
          }
        }

        // HERE MUST BE OPAQUE
      }

      // iterates on all regions in the operation
      void check_ops_regions(MLIRContext* context, Region* region, Block* block, Operation* op)
      {
        size_t reg_count = 0;
        for (Region &region_it: op->getRegions())
        {
          // llvm::outs() << "reg: " << reg_count << "\n";
          ++reg_count;
          check_regions(context, &region_it, block);
        }
      }

      // iterates on all blocks in the region
      void check_regions(MLIRContext* context, Region* region, Block* block)
      {
        size_t block_count = 0;
        for (Block &block_it: region->getBlocks())
        {
          // llvm::outs() << "block: " << block_count << "\n";
          ++block_count;
          check_blocks(context, region, &block_it);
        }
      }

      // iterates on all operation in the block
      void check_blocks(MLIRContext* context, Region* region, Block* block)
      {
        size_t op_count = 0;
        for (Operation &op_it: block->getOperations())
        {
          // llvm::outs() << "op: " << op_count << "\n";
          ++op_count;
          check_operation(context, region, block, &op_it);
        }
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
      std::string func_name = "wrapped_div_func";
      Operation* module_ptr = nullptr;
      Region* first_module_reg = nullptr;
      size_t cur_func_num = 0;    // stores total number of created function in order to create lables
  }; 
} // namespace

// Creates an instance of the C-style expressions forming pass.
// Exposes this pass to the outside world.
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}
