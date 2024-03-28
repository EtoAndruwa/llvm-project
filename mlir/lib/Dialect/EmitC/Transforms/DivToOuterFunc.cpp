#include "mlir/Dialect/EmitC/IR/EmitC.h"
#include "mlir/Dialect/EmitC/Transforms/Passes.h"
#include "mlir/Dialect/EmitC/Transforms/Transforms.h"
#include "mlir/Transforms/GreedyPatternRewriteDriver.h"

namespace mlir {
namespace emitc {
#define GEN_PASS_DEF_DIVTOOUTERFUNC
#include "mlir/Dialect/EmitC/Transforms/Passes.h.inc"
} // namespace emitc
} // namespace mlir

using namespace mlir;
using namespace emitc;

namespace {
struct DivToOuterFuncPass
    : public emitc::impl::DivToOuterFuncBase<DivToOuterFuncPass> {
  // public methods/variables section
public:
  /// Entry function for the transformation
  /// using this operation pass by MLIR.
  void runOnOperation() override {
    Operation *rootOpPtr = getOperation();
    modulePtr = rootOpPtr; // saves module ptr in the class's field for the
                           // future creation of wrapping function
    checkOperation(/*regionPtr=*/nullptr, /*blockPtr=*/nullptr, rootOpPtr);
  }

  /// This enum is used for operands/returns types.
  typedef enum class OperandTypes {
    Int,
    Float,
    Opaque,
  } OperandTypes;

  // private methods section
private:
  /// This method checks the operation for being "emitc.div" operation.
  /// If so, it calls the method 'transformIR'. Otherwise enters nested
  /// regions/blocks.
  bool checkOperation(Region *const regionPtr, Block *const blockPtr,
                      Operation *const operationPtr) {
    if (operationPtr == nullptr)
      return false; // pings that no transformation occured

    if (dyn_cast<emitc::DivOp>(operationPtr)) // if it is 'emitc.div' operation
    {
      transformIR(operationPtr);
      return true; // pings that transformation occured
    } else {
      checkOpsRegion(operationPtr);
      return false; // pings that no transformation occured
    }
  }

  /// This method transforms one 'emitc.div' operation per pass
  /// into the 'emitc.call' operation to the wrapping function
  void transformIR(Operation *const operationPtr) {
    Region &topRegRef =
        modulePtr->getRegion(0); // getting the first region in the module
    OpBuilder wrapperBuilder(topRegRef); // sets the builder (ALWAYS!!!
                                         // to the start of the region)

    std::vector<Type> stringOperTypes = getOperandTypes(
        operationPtr); // getting types as strings like 'i32', etc.
    std::vector<Type> stringRetTypes = getReturnTypes(operationPtr);

    SmallVector<Type> operTypes; // stores types built by builder
    SmallVector<Type> retTypes;
    buildOperandTypes(operTypes, stringOperTypes,
                      wrapperBuilder); // sets types of args from strings
    buildOperandTypes(retTypes, stringRetTypes, wrapperBuilder);

    FuncOp funcOp =
        createDivWrapper(wrapperBuilder, operTypes,
                         retTypes); // creates the 'emitc.div' wrapping function

    OpBuilder callOpBuilder(operationPtr); // sets the builder for callOp
    Operation *callOp = callOpBuilder.create<emitc::CallOp>(
        callOpBuilder.getUnknownLoc(), funcOp,
        ArrayRef<Value>{
            operationPtr->getOperand(0),
            operationPtr->getOperand(1)}); // creates the 'emitc.call' operation

    replaceDivOpsUses(
        operationPtr,
        callOp); // replacing all uses of 'emitc.div' to the 'emitc.call'
    operationPtr->erase();
    ++сurFuncNum;
  }

  /// This method iterates over all nested regions that operation has.
  void checkOpsRegion(Operation *const operationPtr) {
    if (operationPtr != nullptr)
      for (Region &regRef : operationPtr->getRegions())
        checkRegions(&regRef);
  }

  /// This method iterates over all nested regions that the operation has.
  /// It has inner logic to make multiple passes inside the block to
  /// transform all 'emitc.div' operations to 'emitc.call' operations.
  void checkRegions(Region *const regionPtr) {
    if (regionPtr != nullptr) {
      auto itBlocksBegin = regionPtr->getBlocks().begin();
      auto itBlocksEnd = regionPtr->getBlocks().end();

      for (; itBlocksBegin != itBlocksEnd;)
        if (!checkBlocks(regionPtr, &(*itBlocksBegin)))
          ++itBlocksBegin;
    }
  }

  /// This method iterates over all nested operations that block has.
  bool checkBlocks(Region *const regionPtr, Block *const blockPtr) {
    if (blockPtr != nullptr) {
      for (Operation &opRef : blockPtr->getOperations())
        if (checkOperation(regionPtr, blockPtr, &opRef))
          return true; // if some operation in the block was transformed

      return false;
    } else {
      return false;
    }
  }

  /// This method gets the results' types of operation
  /// and stores them in the std::vector<Type>.
  std::vector<Type> getReturnTypes(Operation *const operationPtr) {
    std::vector<Type> vecRetTypes;
    for (Type resType : operationPtr->getResultTypes())
      vecRetTypes.push_back(resType);

    return vecRetTypes;
  }

  /// This method gets the operands' types of operation
  /// and stores them in the std::vector<Type>.
  std::vector<Type> getOperandTypes(Operation *const operationPtr) {
    std::vector<Type> vecOperTypes;
    for (Type operType : operationPtr->getOperandTypes())
      vecOperTypes.push_back(operType);

    return vecOperTypes;
  }

  /// This method replaces all uses of 'emitc.div' return value
  /// to the return value of 'emitc.call' operation.
  void replaceDivOpsUses(Operation *const divOpPtr,
                         Operation *const callOpPtr) {
    Value divRetVal = divOpPtr->getResult(0);
    Value callRetVal = callOpPtr->getResult(0);

    for (auto &use : divOpPtr->getUses())
      use.getOwner()->replaceUsesOfWith(divRetVal, callRetVal);
  }

  /// This method creates the wrapper around the emitc.div operation with
  /// appropriate return type and operands' types.
  FuncOp createDivWrapper(OpBuilder &builder,
                          const SmallVector<Type> &operTypes,
                          const SmallVector<Type> &retTypes) {
    FunctionType funcType = builder.getFunctionType({operTypes}, {retTypes});
    FuncOp funcOp =
        builder.create<FuncOp>(builder.getUnknownLoc(),
                               funcName + std::to_string(сurFuncNum), funcType);

    Block *entryBlockPtr = funcOp.addEntryBlock();
    OpBuilder entryBlockBuilder(entryBlockPtr, entryBlockPtr->begin());

    Value arg1 = entryBlockPtr->getArgument(0);
    Value arg2 = entryBlockPtr->getArgument(1);

    Value divResult = entryBlockBuilder.create<DivOp>(
        entryBlockBuilder.getUnknownLoc(), retTypes[0], arg1, arg2);
    entryBlockBuilder.create<emitc::ReturnOp>(entryBlockBuilder.getUnknownLoc(),
                                              divResult);

    return funcOp;
  }

  /// This method gets the lenght in bits for the specified operands' types.
  size_t getBitLenght(const std::vector<Type> &typesVec, const size_t index) {
    // This part is for IntegerType bit lenght
    for (size_t width = 8; width <= 64; width *= 2)
      if (typesVec[index].isa<IntegerType>() &&
          typesVec[index].cast<IntegerType>().getWidth() == width)
        return width;

    // This part is for FloatType bit lenght
    for (size_t width = 32; width <= 64; width *= 2)
      if (typesVec[index].isa<FloatType>() &&
          typesVec[index].cast<FloatType>().getWidth() == width)
        return width;
  }

  /// This method creates the types of operands using builder.get.....()
  /// For example builder.getF32Type(), etc. .
  void buildOperandTypes(SmallVector<Type> &destVec,
                         const std::vector<Type> &srcVec, OpBuilder &builder) {
    for (size_t index = 0; index < srcVec.size(); ++index) {
      switch (getOperandType(srcVec, index)) {
      case OperandTypes::Int: {
        destVec.push_back(builder.getIntegerType(getBitLenght(srcVec, index)));
        break;
      }
      case OperandTypes::Float: {
        if (getBitLenght(srcVec, index) == 32)
          destVec.push_back(builder.getF32Type());
        else
          destVec.push_back(builder.getF64Type());
        break;
      }
      default:
        break;
      }
    }
  }

  /// This method gets the type of operand/return value
  /// using its index int the std::vector<Type>.
  OperandTypes getOperandType(const std::vector<Type> &srcVec,
                              const size_t index) {
    if (srcVec[index].isa<IntegerType>())
      return OperandTypes::Int;

    if (srcVec[index].isa<FloatType>())
      return OperandTypes::Float;
  }

  /// This method is used by MLIR to get all dependencies for the pass.
  void getDependentDialects(DialectRegistry &registry) const override {
    registry.insert<emitc::EmitCDialect>();
  }

  // private variables section
private:
  std::string funcName =
      "wrapped_div_func";         // stores the name of the wrapping fucntion
  Operation *modulePtr = nullptr; // stores the pointer to the builtin.module
  size_t сurFuncNum = 0; // stores the total number of created functions in
                         // order to create labels
};
} // namespace

/// Creates an instance of the C-style expressions forming pass.
/// Exposes this pass to the outside world.
std::unique_ptr<Pass> emitc::createDivToOuterFuncPass() {
  return std::make_unique<DivToOuterFuncPass>();
}
