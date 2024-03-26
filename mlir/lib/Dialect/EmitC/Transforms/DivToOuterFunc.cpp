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

namespace // <--------- namespace's start
{
  // this is struct for my pass 
  struct DivToOuterFuncPass: public emitc::impl::DivToOuterFuncBase<DivToOuterFuncPass> 
  {
    // public methods/variables section 
    public:

      /**
       * Entry function for the transformation 
       * using this operation pass by MLIR.
      */
      void runOnOperation() override 
      {
        MLIRContext* context_ptr = &getContext();   // gets the context 
        Operation* rootOp        = getOperation();  // gets the pointer to the top level operation in the context
        module_ptr               = rootOp;          // saves module ptr in the class's field for the future creation of wrapping function
        check_operation(context_ptr, nullptr, nullptr, rootOp);
      }

      /**
       * This enum is used for operands/returns types. 
      */
      typedef enum class operand_types
      {
        INT,
        FLOAT,
        OPAQUE,
      }operand_types;

    // private methods section
    private:
    
      /**
       * This method checks the operation for being "emitc.div" operation.
       * If so, it calls the method 'transform'. Otherwise enters nested regions/blocks.
      */
      bool check_operation(MLIRContext* context_ptr, Region* region_ptr, Block* block_ptr, Operation* operation_ptr)
      {
        if (operation_ptr == nullptr)
        {
          return false; // pings that no transformation occured
        }
        else 
        {
          if (dyn_cast<emitc::DivOp>(operation_ptr)) // if it is 'emitc.div' operation
          {
            transform(context_ptr, operation_ptr);
            return true; // pings that transformation occured
          }
          else
          {
            check_ops_regions(context_ptr, region_ptr, block_ptr, operation_ptr);
            return false; // pings that no transformation occured
          }
        }
      }

      // 
      void transform(MLIRContext* context_ptr, Operation* operation_ptr)
      {
        Region& top_level_region = module_ptr->getRegion(0); // getting the first region in the module
        OpBuilder wrapper_builder(top_level_region); // setting the builder for that region (ALWAYS!!! to the start of the region)

        std::vector<Type> return_types  = getReturnTypes(operation_ptr); // getting string like 'i32'
        std::vector<Type> operand_types = getOperandTypes(operation_ptr); // getting string like 'i32'

        SmallVector<Type> argTypes; // for types built by builder
        SmallVector<Type> retTypes; // for types built by builder
        build_op_types(argTypes, operand_types, wrapper_builder); // setting types of args from strings
        build_op_types(retTypes, return_types, wrapper_builder); // setting types of ret from strings

        FuncOp funcOp = create_div_wrapper(context_ptr, wrapper_builder, argTypes, retTypes); // creates the emitc.div wrapper

        OpBuilder callOp_builder(operation_ptr);
        Operation* callOp = callOp_builder.create<emitc::CallOp>(callOp_builder.getUnknownLoc(), funcOp, 
        ArrayRef<Value>{operation_ptr->getOperand(0), operation_ptr->getOperand(1)}); // creates the callOp
      

        replace_div_uses(operation_ptr, callOp); // replacing all uses of 'emitc.div' to the 'emitc.call'
        operation_ptr->erase();
        ++cur_func_num;
      }

      /**
       * This method iterates over all nested regions that operation has.
      */
      void check_ops_regions(MLIRContext* context_ptr, Region* region_ptr, Block* block_ptr, Operation* operation_ptr)
      {
        if (operation_ptr != nullptr)
        {
          for (Region &region_it: operation_ptr->getRegions())
          {
            check_regions(context_ptr, &region_it, block_ptr);
          }
        }
      }

      /**
       * This method iterates over all nested regions that the operation has.
       * It has inner logic to make multiple passes inside the block to
       * transform all 'emitc.div' operations to 'emitc.call' operations.
      */
      void check_regions(MLIRContext* context_ptr, Region* region_ptr, Block* block_ptr)
      {
        if (region_ptr != nullptr)
        {
          auto itBegin = region_ptr->getBlocks().begin();
          auto itEnd = region_ptr->getBlocks().end();

          for (;itBegin != itEnd;)
          {
            if(!check_blocks(context_ptr, region_ptr, &(*itBegin)))
            {
              ++itBegin;
            }
          }
        }
      }

      /**
       * This method iterates over all nested operations that block has.
      */
      bool check_blocks(MLIRContext* context_ptr, Region* region_ptr, Block* block_ptr)
      {
        if (block_ptr != nullptr)
        {
          for (Operation &op_it: block_ptr->getOperations())
          {
            if(check_operation(context_ptr, region_ptr, block_ptr, &op_it)) // if some operation in the block was transformed
            {
              return true;
            }
          }
          return false;
        }
        else 
        {
          return false;
        }
      }

      /**
       * This method gets the results' types of operation 
       * and stores them in the std::vector<Type>.
      */
      std::vector<Type> getReturnTypes(Operation* const operation_ptr) 
      {
          std::vector<Type> returnTypes;
          for (Type resultType: operation_ptr->getResultTypes()) 
          {
            returnTypes.push_back(resultType);
          }
          return returnTypes;
      }

      /**
       * This method gets the operands' types of operation 
       * and stores them in the std::vector<Type>.
      */
      std::vector<Type> getOperandTypes(Operation* const operation_ptr)
      {
          std::vector<Type> operandTypes;
          for (Type operandType: operation_ptr->getOperandTypes()) 
          {
            operandTypes.push_back(operandType);
          }
          return operandTypes;
      }

      /**
       * This method replaces all uses of 'emitc.div' return value
       * to the return value of 'emitc.call' operation.
      */
      void replace_div_uses(Operation* const divOp, Operation* const callOp)
      {
        Value divOp_ret_val  = divOp->getResult(0);  // getting the result of divOp as value
        Value callOp_ret_val = callOp->getResult(0); // getting the result of callOp as value
        
        // iterates over all uses of divOp_ret_val and replaces them with callOp_ret_val.
        for (auto &use : divOp->getUses()) 
        {
          use.getOwner()->replaceUsesOfWith(divOp_ret_val, callOp_ret_val); 
        }
      }

      // 
      FuncOp create_div_wrapper(MLIRContext* context_ptr, OpBuilder& builder, SmallVector<Type>& argTypes, SmallVector<Type>& retTypes)
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

      /**
       * This method gets the lenght in bits for the specified operands' types.
      */
      size_t get_bit_length(const std::vector<Type>& operand_types, const size_t operand_index)
      {
        // This part is for IntegerType bit lenght
        for (size_t j = 8; j <= 64; j *= 2)
        {
          if (operand_types[operand_index].isa<IntegerType>() && operand_types[operand_index].cast<IntegerType>().getWidth() == j)
          {
            return j;
          }
        }

        // This part is for FloatType bit lenght
        for (size_t j = 32; j <= 64; j *= 2)
        {
          if (operand_types[operand_index].isa<FloatType>() && operand_types[operand_index].cast<FloatType>().getWidth() == j)
          {
            return j;
          }
        }
      }

      /**
       * This method creates the types of operands using builder.get.....()
       * For example builder.getF32Type(), etc. .
      */
      void build_op_types(SmallVector<Type>& dest_vec, std::vector<Type>& src_vec, OpBuilder& builder)
      {
        for (size_t i = 0; i < src_vec.size(); ++i)
        {
          switch (get_type(src_vec, i))
          {
          case operand_types::INT:
            {
              dest_vec.push_back(builder.getIntegerType(get_bit_length(src_vec, i)));
              break;    
            }
          case operand_types::FLOAT:
            {
              if (get_bit_length(src_vec, i) == 32)
              {
                dest_vec.push_back(builder.getF32Type());
              }
              else 
              {
                dest_vec.push_back(builder.getF64Type());
              }
              break;
            }
          default:
            {
              break;
            }
          }
        }
      }

      /**
       * This method gets the type of operand/return value
       * using its index int the std::vector<Type>.
      */
      operand_types get_type(std::vector<Type>& src_vec, size_t val_index)
      {
        if (src_vec[val_index].isa<IntegerType>())
        {
          return operand_types::INT;
        }

        if (src_vec[val_index].isa<FloatType>())
        {
          return operand_types::FLOAT;
        }
      }
      
      /**
       * This method is used by MLIR to get all dependencies for the pass.
      */
      void getDependentDialects(DialectRegistry& registry) const override 
      {
        registry.insert<emitc::EmitCDialect>(); // this pass depends on to the EmitC dialect
      }

    // private variables section
    private:
      std::string func_name    = "wrapped_div_func"; // stores the name of the wrapping fucntion  
      Operation* module_ptr    = nullptr;            // stores the pointer to the builtin.module  
      size_t cur_func_num      = 0;                  // stores the total number of created functions in order to create labels
  }; 
} // <--------- namespace's end


/**
 * Creates an instance of the C-style expressions forming pass.
 * Exposes this pass to the outside world.
*/
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}
