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
      OpBuilder builder(context);
      module_ptr = rootOp; // saving module ptr in the class's field
    
      Region& reg = module_ptr->getRegion(0);
      // reg.viewGraph();
      check_operation(context, builder, nullptr, nullptr, nullptr, rootOp);
      // reg.viewGraph();
      // printOperation(rootOp, llvm::outs());
    }

    // private methods section
    private:
    
      // checks the operation
      void check_operation(MLIRContext* context, OpBuilder& builder, ModuleOp* module, Region* region, Block* block, Operation* op)
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

          check_ops_regions(context, builder, module, region, block, op);
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
        create_emitc_func_decl(context, builder, operand_types, return_types);
      }

      void create_emitc_func_decl(MLIRContext* context, OpBuilder& builder, std::vector<Type>& operand_types, std::vector<Type>& return_types)
      {
        FunctionType funcType = builder.getFunctionType({}, {builder.getIntegerType(32)}); // here we must specify types
        FuncOp funcOp = builder.create<FuncOp>(builder.getUnknownLoc(), func_name + std::to_string(cur_func_num), funcType);

        Block* entryBlock = funcOp.addEntryBlock();
        OpBuilder entryBlock_builder(entryBlock, entryBlock->begin());

        Type i32Type = IntegerType::get(context, 32);
        Attribute intAttr = IntegerAttr::get(IntegerType::get(context, 32), 42);
        Value constantValue = entryBlock_builder.create<ConstantOp>(entryBlock_builder.getUnknownLoc(), i32Type, intAttr);
        entryBlock_builder.create<emitc::ReturnOp>(entryBlock_builder.getUnknownLoc(), Value(constantValue));
      }

      // prints the types of returms/operand values (DEBUG ONLY)  
      void print_types(std::vector<Type>& op_types)
      {
        for (Type op_type : op_types) 
        {
          llvm::outs() << "Type: " << op_type << "\n";
        }
      }

      int get_bit_length(std::vector<Type>& operand_types, size_t operand_index)
      {
        for (size_t j = 8; j <= 64; j *= 2)
        {
          if (operand_types[operand_index].isa<IntegerType>() && operand_types[operand_index].cast<IntegerType>().getWidth() == j)
          {
            // llvm::outs() << "IntegerType" << j << "\n";
            return j;
          }
        }

        for (size_t j = 32; j <= 64; j *= 2)
        {
          if (operand_types[operand_index].isa<FloatType>() && operand_types[operand_index].cast<FloatType>().getWidth() == j)
          {
            // llvm::outs() << "FloatType" << j << "\n";
            return j;
          }
        }

        return error_code::OPAQUE;
      }

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

        return op_types::OPAQUE;
      }

      // iterates on all regions in the operation
      void check_ops_regions(MLIRContext* context, OpBuilder& builder, ModuleOp* module, Region* region, Block* block, Operation* op)
      {
        size_t reg_count = 0;
        for (Region &region_it: op->getRegions())
        {
          // llvm::outs() << "reg: " << reg_count << "\n";
          ++reg_count;
          check_regions(context, builder, module, &region_it, block);
        }
      }

      // iterates on all blocks in the region
      void check_regions(MLIRContext* context, OpBuilder& builder, ModuleOp* module, Region* region, Block* block)
      {
        size_t block_count = 0;
        for (Block &block_it: region->getBlocks())
        {
          // llvm::outs() << "block: " << block_count << "\n";
          ++block_count;
          check_blocks(context, builder, module, region, &block_it);
        }
      }

      // iterates on all operation in the block
      void check_blocks(MLIRContext* context, OpBuilder& builder, ModuleOp* module, Region* region, Block* block)
      {
        size_t op_count = 0;
        for (Operation &op_it: block->getOperations())
        {
          // llvm::outs() << "op: " << op_count << "\n";
          ++op_count;
          check_operation(context, builder, module, region, block, &op_it);
        }
      }
      
      void getDependentDialects(DialectRegistry &registry) const override 
      {
        registry.insert<emitc::EmitCDialect>();
      }

      // clones all opetaions from block src to dest
      void clone_block(Block* const src, Block* const dest)
      {
        for (Operation &op_it : *src) 
        {
          Operation* clonedOp = op_it.clone();
          dest->push_back(clonedOp);
        }
      }

      // 
      void print_op_attrs(Operation* op, MLIRContext* context)
      {
        ArrayRef<NamedAttribute> attrsRef = op->getAttrs();

        // Construct a DictionaryAttr from the ArrayRef<NamedAttribute>.
        DictionaryAttr attrs = DictionaryAttr::get(context, attrsRef);

        // Iterate over attributes and print their names and values.
        for (NamedAttribute attr : attrsRef) {
          llvm::outs() << "Attribute: " << attr.getName() << ", Value: ";
          if (attr.getValue()) 
          {
            llvm::outs() << attr.getValue();
          } 
          else 
          {
            llvm::outs() << "<null>";
          }
          llvm::outs() << "\n";
        }
      }

      // count the number of regions in the module
      size_t count_regs_in_module(Operation* op)
      {
        size_t regionCount = 0;
        for (Region &region : op->getRegions())
        {
          ++regionCount;
        }

        return regionCount;
      }

      // casts the root operation to the module
      ModuleOp castToModule(Operation* op) 
      {
        return dyn_cast<ModuleOp>(op);
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
      static size_t cur_func_num;    // stores total number of created function in order to create lables
      std::string func_name = "wrapped_div_func";
      Operation* module_ptr = nullptr;
      Region* first_module_reg = nullptr;
 
      enum class op_types
      {
        INT,
        FLOAT,
        OPAQUE
      };

      enum class error_code
      {
        OPAQUE_VAL = -1;
      };
}; 

size_t DivToOuterFuncPass::cur_func_num = 0;    // stores total number of created function in order to create lables
// size_t DivToOuterFuncPass::pass_called_num = 0; // stores the total number of times when pass called

} // namespace

// Creates an instance of the C-style expressions forming pass.
// Exposes this pass to the outside world.
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}
