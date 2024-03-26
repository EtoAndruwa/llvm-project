// RUN: mlir-opt %s -div-to-outer-func -verify-diagnostics | FileCheck %s

// CHECK-LABEL: emitc.func @wrapped_div_func{{[0-9]+}}(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(f64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func{{[0-9]+}}(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(f32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func{{[0-9]+}}(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(i64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func{{[0-9]+}}(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func{{[0-9]+}}(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(i16)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func{{[0-9]+}}(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i8)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

emitc.func @foo1() -> i8 
{
    %zero = emitc.literal "0.0F" : i8
    %hundred = emitc.literal "100.0F" : i8
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i8} : () -> i8
    "emitc.assign"(%data, %zero): (i8, i8) -> ()
    %result = emitc.div %hundred, %data : (i8, i8) -> i8
    emitc.return %result: i8
}

emitc.func @foo2() -> i16 
{
    %zero = emitc.literal "0.0F" : i16
    %hundred = emitc.literal "100.0F" : i16
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i16} : () -> i16
    "emitc.assign"(%data, %zero): (i16, i16) -> ()
    %result = emitc.div %hundred, %data : (i16, i16) -> i16
    emitc.return %result: i16
}


emitc.func @foo3() -> i32 
{
    %zero = emitc.literal "0.0F" : i32
    %hundred = emitc.literal "100.0F" : i32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data, %zero): (i32, i32) -> ()
    %result = emitc.div %hundred, %data : (i32, i32) -> i32
    emitc.return %result: i32
}

emitc.func @foo4() -> i64 
{
    %zero = emitc.literal "0.0F" : i64
    %hundred = emitc.literal "100.0F" : i64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i64} : () -> i64
    "emitc.assign"(%data, %zero): (i64, i64) -> ()
    %result = emitc.div %hundred, %data : (i64, i64) -> i64
    emitc.return %result: i64
}

emitc.func @foo5() -> f32 
{
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    %result = emitc.div %hundred, %data : (f32, f32) -> f32
    emitc.return %result: f32
}

emitc.func @foo6() -> f64 
{
    %zero = emitc.literal "0.0F" : f64
    %hundred = emitc.literal "100.0F" : f64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f64} : () -> f64
    "emitc.assign"(%data, %zero): (f64, f64) -> ()
    %result = emitc.div %hundred, %data : (f64, f64) -> f64
    emitc.return %result: f64
}


