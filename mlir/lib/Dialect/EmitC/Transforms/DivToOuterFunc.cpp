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
      ++pass_called_num;

      Operation* rootOp = getOperation();
      auto module = castToModule(rootOp);

      if (module) 
      {
        // If the current operation is not a module, report an error or handle appropriately.
        
        OpBuilder builder(&getContext());

        // Define the integer type (e.g., i32)
        IntegerType intType = IntegerType::get(&getContext(), 32); // 32-bit integer type

        // Create a constant integer with value 42
        Value constantInt = builder.create<ConstantOp>(builder.getUnknownLoc(), intType,
                                                      builder.getIntegerAttr(intType, 42));

        // Print the MLIR IR of the constant integer value
        constantInt.dump();
        module.push_back(constantInt.getDefiningOp());                  
      }

      // print_all_ops(rootOp);

      check_operation(rootOp);

      print_debug_data();
    }

    // private methods section
    private:
      
      // casts the root operation to the module
      ModuleOp castToModule(Operation *op) 
      {
        return dyn_cast<ModuleOp>(op);
      }     

      // checks the operation
      void check_operation(Operation *op)
      {
        llvm::StringRef div_strref = "emitc.div";
        auto cur_op_name = op->getName().getStringRef();
        
        if (cur_op_name == div_strref)
        {
          ++cur_func_num;
        }

        for (Region &region : op->getRegions())
          check_regions(region);
      }

      // iterates on all blocks in the region
      void check_regions(Region& region)
      {
        for (Block &block : region.getBlocks())
          check_blocks(block);
      }

      // iterates on all operation in the block
      void check_blocks(Block &block)
      {
        for (Operation &op : block.getOperations())
          check_operation(&op);
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
        outs << "The total number of pass calls = " << pass_called_num << "\n";
        outs << "=================================DEBUG=================================\n";
      }

    // private variables section
    private:
      static size_t cur_func_num;    // stores total number of created function in order to create lables
      static size_t pass_called_num; // stores the total number of times when pass called
  }; 

size_t DivToOuterFuncPass::cur_func_num = 0;    // stores total number of created function in order to create lables
size_t DivToOuterFuncPass::pass_called_num = 0; // stores the total number of times when pass called

} // namespace

// Creates an instance of the C-style expressions forming pass.
// Exposes this pass to the outside world.
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}