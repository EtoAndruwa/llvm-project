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
      // ++pass_called_num;
      Operation* rootOp = getOperation();
      OpBuilder builder(&getContext());

      check_operation(builder, nullptr, nullptr, nullptr, rootOp);
      // print_debug_data();
      print_op_names(rootOp);
    }

    // private methods section
    private:
    
      

      // checks the operation
      void check_operation(OpBuilder& builder, ModuleOp* module, Region* region, Block* block, Operation* op)
      {
        llvm::StringRef div_strref = "emitc.div";
        llvm::StringRef module_name = "builtin.module";
        auto cur_op_name = op->getName().getStringRef();

        if (cur_op_name == module_name)
        { 
          llvm::outs() << "module!\n";
          size_t reg_num = count_regs_in_module(op);
          llvm::outs() << "before reg_num: " << reg_num << "\n";

          FuncOp func = FuncOp::create(builder.getUnknownLoc(), "my_func",
                                      FunctionType::get(builder.getContext(), {}, {}));

          builder.setInsertionPointToEnd(&func.getBody().front());
          builder.create<ReturnOp>(builder.getUnknownLoc());
          castToModule(op).push_back(func);

          llvm::outs() << "after reg_num: " << reg_num << "\n";
        }

        // if (region != nullptr && region->hasOneBlock() && cur_op_name != module_name)
        // {
        //   region->viewGraph();
        //   Block* new_block = new Block();
        //   region->push_back(new_block);
        //   Block* new_block1 = new Block();
        //   region->push_back(new_block1);
        //   llvm::outs() << "region->getBlocks().size() = " << region->getBlocks().size() << "\n";
        //   region->viewGraph();
        // }

        if (cur_op_name == div_strref)
        {
          // create_div_wrapper(builder, module, region, block, op);
          // auto intType = builder.getIntegerType(32);
          // SmallVector<Type, 2> inputTypes({intType, intType});
          // SmallVector<Type, 1> resultTypes({intType});

          // // Create operands for input values
          // Value operand1 = builder.create<emitc::ConstantOp>(builder.getUnknownLoc(), intType, builder.getIntegerAttr(intType, 10));
          // Value operand2 = builder.create<emitc::ConstantOp>(builder.getUnknownLoc(), intType, builder.getIntegerAttr(intType, 20));

          // Create an EmitC call operation and add it to the module
          auto calleeAttr = builder.getStringAttr("foo_0");
          OperationState state(builder.getUnknownLoc(), "emitc.call");
          state.addAttribute("callee", calleeAttr);
          Operation *callOp = Operation::create(state);
          block->push_back(callOp);


          // std::string cur_func_name = "foo_" + std::to_string(cur_func_num);

     
          // OperationState state(builder.getUnknownLoc(), "emitc.call");
          // state.addAttribute("callee", builder.getStringAttr(cur_func_name));

          // // Add other attributes, operands, and results as needed

          // Operation *callOp = Operation::create(state);
          // module.push_back(callOp);
          ++cur_func_num;
        }

        size_t reg_count = 0;
        for (Region &region_it: op->getRegions())
        {
          llvm::outs() << "reg: " << reg_count << "\n";
          check_regions(builder, module, &region_it, block);
          ++reg_count;
        }
      }



      void create_div_wrapper(OpBuilder& builder, ModuleOp* module, Region* region, Block* block, Operation* op)
      {
        Location loc = builder.getUnknownLoc();
        auto funcType = builder.getFunctionType({}, {});

        OperationState state(loc, "emitc.func");
        state.addAttribute("sym_name", builder.getStringAttr("foo_0"));
        state.addAttribute("type", TypeAttr::get(funcType));
        Operation *funcOp = Operation::create(state);
        block->push_back(funcOp);
        // Region &region = module->getBodyRegion();
        // Block &block = region->getBodyBlock();
        // block.push_back(funcOp);
      }

      // iterates on all blocks in the region
      void check_regions(OpBuilder& builder, ModuleOp* module, Region* region, Block* block)
      {
        size_t block_count = 0;
        for (Block &block_it: region->getBlocks())
        {
          llvm::outs() << "block: " << block_count << "\n";
          check_blocks(builder, module, region, &block_it);
          ++block_count;
        }
      }

      // iterates on all operation in the block
      void check_blocks(OpBuilder& builder, ModuleOp* module, Region* region, Block* block)
      {
        size_t op_count = 0;
        for (Operation &op_it: block->getOperations())
        {
          llvm::outs() << "op: " << op_count << "\n";
          check_operation(builder, module, region, block, &op_it);
          ++op_count;
        }
      }
      
      void getDependentDialects(DialectRegistry &registry) const override 
      {
        registry.insert<emitc::EmitCDialect>();
      }

      void clone_block(Block* const src, Block* const dest)
      {
        for (Operation &op_it : *src) 
        {
          Operation* clonedOp = op_it.clone();
          dest->push_back(clonedOp);
        }
      }

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

      // prints op's attributes (DEBUG ONLY)  
      void print_op_attrs(Operation* const op)  
      {
        static size_t op_number = 0;
        ArrayRef<NamedAttribute> attrs = op->getAttrs();

        llvm::outs () << "=========================OP_" << op_number << "=========================\n";
        for (auto attr : attrs) 
        {
          llvm::outs() << "Attribute: " << attr.getName() << ", Value: " << attr.getValue() << "\n";
        }
        llvm::outs () << "=========================OP_" << op_number << "=========================\n\n";
        ++op_number;
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
  }; 

size_t DivToOuterFuncPass::cur_func_num = 0;    // stores total number of created function in order to create lables
// size_t DivToOuterFuncPass::pass_called_num = 0; // stores the total number of times when pass called

} // namespace

// Creates an instance of the C-style expressions forming pass.
// Exposes this pass to the outside world.
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}
