//===-- Passes.td - pass definition file -------------------*- tablegen -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef MLIR_DIALECT_EMITC_TRANSFORMS_PASSES
#define MLIR_DIALECT_EMITC_TRANSFORMS_PASSES

include "mlir/Pass/PassBase.td"

def FormExpressions : Pass<"form-expressions"> {
  let summary = "Form C-style expressions from C-operator ops";
  let description = [{
    The pass wraps emitc ops modelling C operators in emitc.expression ops and
    then folds single-use expressions into their users where possible.
  }];
  let constructor = "mlir::emitc::createFormExpressionsPass()";
  let dependentDialects = ["emitc::EmitCDialect"];
}

def DivToOuterFunc : Pass<"div-to-outer-func"> {
  let summary = "Wraps the emit.div with function call outside the module";
  let description = [{
    This pass wraps the emit.div operation with the emitc.call 
    to the created function outside the given module.
  }];
  let constructor = "mlir::emitc::createDivToOuterFuncPass()";
  let dependentDialects = ["emitc::EmitCDialect"];
}

#endif // MLIR_DIALECT_EMITC_TRANSFORMS_PASSES
