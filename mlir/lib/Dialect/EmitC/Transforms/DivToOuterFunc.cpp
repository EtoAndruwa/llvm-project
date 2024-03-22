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

      get_div_op(rootOp);
    }


    // void print_all_ops(Operation *op)
    // {

    // }

    // bool isModule(Operation *op) 
    // {
    //   return op->hasTrait<OpTrait::IsAModule>();
    // }

    // OK
    ModuleOp castToModule(Operation *op) 
    {
      return dyn_cast<ModuleOp>(op);
    }     

    void get_div_op(Operation *op)
    {
      llvm::StringRef div_strref = "emitc.div";
      auto cur_op_name = op->getName().getStringRef();
      

      if (cur_op_name == div_strref)
      {
        llvm::outs() << cur_op_name;
      }

      for (Region &region : op->getRegions())
        check_div_in_reg(region);
    }

    void check_div_in_reg(Region& region)
    {
      for (Block &block : region.getBlocks())
        check_div_in_block(block);
    }

    void check_div_in_block(Block &block)
    {
      for (Operation &op : block.getOperations())
        get_div_op(&op);
    }
    
    void getDependentDialects(DialectRegistry &registry) const override 
    {
      registry.insert<emitc::EmitCDialect>();
    }

  }; 
} // namespace


// Creates an instance of the C-style expressions forming pass.
// Exposes this pass to the outside world.
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}