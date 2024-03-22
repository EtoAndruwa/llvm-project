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

      check_operation(rootOp, builder, module);
      print_debug_data();
    }

    // private methods section
    private:
      

      // checks the operation
      void check_operation(Operation *op, OpBuilder& builder, ModuleOp& module, Region& region, Block& block)
      {
        llvm::StringRef div_strref = "emitc.div";
        auto cur_op_name = op->getName().getStringRef();

        if (region->getBlocks().size() == 1)
        {

        }

        if (cur_op_name == div_strref)
        {
          create_div_wrapper(builder, module);
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
          block.push_back(callOp);


          // std::string cur_func_name = "foo_" + std::to_string(cur_func_num);

     
          // OperationState state(builder.getUnknownLoc(), "emitc.call");
          // state.addAttribute("callee", builder.getStringAttr(cur_func_name));

          // // Add other attributes, operands, and results as needed

          // Operation *callOp = Operation::create(state);
          // module.push_back(callOp);
          ++cur_func_num;
        }

        for (Region &region: op->getRegions())
        {
          check_regions(region, builder, module);
        }
      }

      void create_div_wrapper(OpBuilder& builder, ModuleOp& module, Region& region, Block& block)
      {
        Location loc = builder.getUnknownLoc();
        auto funcType = builder.getFunctionType({}, {});

        OperationState state(loc, "emitc.func");
        state.addAttribute("sym_name", builder.getStringAttr("foo_0"));
        state.addAttribute("type", TypeAttr::get(funcType));
        Operation *funcOp = Operation::create(state);

        Region &region = module.getBodyRegion();
        Block &block = region.getBodyBlock();
        block.push_back(funcOp);
      }

      // iterates on all blocks in the region
      void check_regions(Region& region, OpBuilder& builder, ModuleOp& module, Region& region, Block& block)
      {
        for (Block &block: region.getBlocks())
          check_blocks(block, builder, module, region, block);
      }

      // iterates on all operation in the block
      void check_blocks(Block &block, OpBuilder& builder, ModuleOp& module, Region& region, Block& block)
      {
        for (Operation &op: block.getOperations())
          check_operation(&op, builder, module, region, block);
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
        // outs << "The total number of pass calls = " << pass_called_num << "\n";
        outs << "=================================DEBUG=================================\n";
      }

      // casts the root operation to the module
      ModuleOp castToModule(Operation *op) 
      {
        return dyn_cast<ModuleOp>(op);
      }     

    // private variables section
    private:
      static size_t cur_func_num;    // stores total number of created function in order to create lables
      // static size_t pass_called_num; // stores the total number of times when pass called
  }; 

size_t DivToOuterFuncPass::cur_func_num = 0;    // stores total number of created function in order to create lables
// size_t DivToOuterFuncPass::pass_called_num = 0; // stores the total number of times when pass called

} // namespace

// Creates an instance of the C-style expressions forming pass.
// Exposes this pass to the outside world.
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}
