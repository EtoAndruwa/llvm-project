// RUN: mlir-opt %s -div-to-outer-func -verify-diagnostics | FileCheck %s

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func49(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func48(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i16)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func47(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i16)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func46(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func45(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func44(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func43(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func42(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func41(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func40(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func39(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func38(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func37(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func36(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func35(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func34(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func33(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func32(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func31(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func30(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(f32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func29(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(f32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func28(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(f32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func27(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(f32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func26(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(f32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func25(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(i64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func24(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func23(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func22(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(i64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func21(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func20(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(i32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func19(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func18(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(i32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func17(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(i32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func16(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func15(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(i16)]]
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func14(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i16)]]
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func13(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(i16)]]
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func12(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i16)]]
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func11(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i16)]]
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func10(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func9(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func8(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func7(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func6(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func5(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(f64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func4(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(f32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func3(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(i64)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func2(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i32)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func1(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(i16)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// CHECK-LABEL: emitc.func @wrapped_div_func0(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i8)]] 
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo0() -> i8
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func0(%{{.*}}, %{{.*}}) : (i8, i8) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8

emitc.func @foo0() -> i8 
{
    %zero = emitc.literal "0.0F" : i8
    %hundred = emitc.literal "100.0F" : i8
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i8} : () -> i8
    "emitc.assign"(%data, %zero): (i8, i8) -> ()
    %result = emitc.div %hundred, %data : (i8, i8) -> i8
    emitc.return %result: i8
}

// CHECK-LABEL: emitc.func @foo1() -> i16
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func1(%{{.*}}, %{{.*}}) : (i16, i16) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16

emitc.func @foo1() -> i16 
{
    %zero = emitc.literal "0.0F" : i16
    %hundred = emitc.literal "100.0F" : i16
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i16} : () -> i16
    "emitc.assign"(%data, %zero): (i16, i16) -> ()
    %result = emitc.div %hundred, %data : (i16, i16) -> i16
    emitc.return %result: i16
}

// CHECK-LABEL: emitc.func @foo2() -> i32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func2(%{{.*}}, %{{.*}}) : (i32, i32) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32

emitc.func @foo2() -> i32 
{
    %zero = emitc.literal "0.0F" : i32
    %hundred = emitc.literal "100.0F" : i32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data, %zero): (i32, i32) -> ()
    %result = emitc.div %hundred, %data : (i32, i32) -> i32
    emitc.return %result: i32
}

// CHECK-LABEL: emitc.func @foo3() -> i64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func3(%{{.*}}, %{{.*}}) : (i64, i64) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64

emitc.func @foo3() -> i64 
{
    %zero = emitc.literal "0.0F" : i64
    %hundred = emitc.literal "100.0F" : i64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i64} : () -> i64
    "emitc.assign"(%data, %zero): (i64, i64) -> ()
    %result = emitc.div %hundred, %data : (i64, i64) -> i64
    emitc.return %result: i64
}

// CHECK-LABEL: emitc.func @foo4() -> f32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func4(%{{.*}}, %{{.*}}) : (f32, f32) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32

emitc.func @foo4() -> f32 
{
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    %result = emitc.div %hundred, %data : (f32, f32) -> f32
    emitc.return %result: f32
}

// CHECK-LABEL: emitc.func @foo5() -> f64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func5(%{{.*}}, %{{.*}}) : (f64, f64) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64

emitc.func @foo5() -> f64 
{
    %zero = emitc.literal "0.0F" : f64
    %hundred = emitc.literal "100.0F" : f64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f64} : () -> f64
    "emitc.assign"(%data, %zero): (f64, f64) -> ()
    %result = emitc.div %hundred, %data : (f64, f64) -> f64
    emitc.return %result: f64
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo6() -> i8 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func6(%{{.*}}, %{{.*}}) : (i16, i16) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8

emitc.func @foo6() -> i8 
{
    %zero = emitc.literal "0.0F" : i16
    %hundred = emitc.literal "100.0F" : i16
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i16} : () -> i16
    "emitc.assign"(%data, %zero): (i16, i16) -> ()
    %result = emitc.div %hundred, %data : (i16, i16) -> i8
    emitc.return %result: i8
}

// CHECK-LABEL: emitc.func @foo7() -> i8
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func7(%{{.*}}, %{{.*}}) : (i32, i32) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8

emitc.func @foo7() -> i8 
{
    %zero = emitc.literal "0.0F" : i32
    %hundred = emitc.literal "100.0F" : i32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data, %zero): (i32, i32) -> ()
    %result = emitc.div %hundred, %data : (i32, i32) -> i8
    emitc.return %result: i8
}

// CHECK-LABEL: emitc.func @foo8() -> i8
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func8(%{{.*}}, %{{.*}}) : (i64, i64) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8

emitc.func @foo8() -> i8 
{
    %zero = emitc.literal "0.0F" : i64
    %hundred = emitc.literal "100.0F" : i64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i64} : () -> i64
    "emitc.assign"(%data, %zero): (i64, i64) -> ()
    %result = emitc.div %hundred, %data : (i64, i64) -> i8
    emitc.return %result: i8
}

// CHECK-LABEL: emitc.func @foo9() -> i8
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func9(%{{.*}}, %{{.*}}) : (f32, f32) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8

emitc.func @foo9() -> i8 
{
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    %result = emitc.div %hundred, %data : (f32, f32) -> i8
    emitc.return %result: i8
}

// CHECK-LABEL: emitc.func @foo10() -> i8
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func10(%{{.*}}, %{{.*}}) : (f64, f64) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8

emitc.func @foo10() -> i8 
{
    %zero = emitc.literal "0.0F" : f64
    %hundred = emitc.literal "100.0F" : f64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f64} : () -> f64
    "emitc.assign"(%data, %zero): (f64, f64) -> ()
    %result = emitc.div %hundred, %data : (f64, f64) -> i8
    emitc.return %result: i8
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo11() -> i16
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func11(%{{.*}}, %{{.*}}) : (i8, i8) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16

emitc.func @foo11() -> i16 
{
    %zero = emitc.literal "0.0F" : i8
    %hundred = emitc.literal "100.0F" : i8
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i8} : () -> i8
    "emitc.assign"(%data, %zero): (i8, i8) -> ()
    %result = emitc.div %hundred, %data : (i8, i8) -> i16
    emitc.return %result: i16
}

// CHECK-LABEL: emitc.func @foo12() -> i16
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func12(%{{.*}}, %{{.*}}) : (i32, i32) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16

emitc.func @foo12() -> i16 
{
    %zero = emitc.literal "0.0F" : i32
    %hundred = emitc.literal "100.0F" : i32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data, %zero): (i32, i32) -> ()
    %result = emitc.div %hundred, %data : (i32, i32) -> i16
    emitc.return %result: i16
}

// CHECK-LABEL: emitc.func @foo13() -> i16
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func13(%{{.*}}, %{{.*}}) : (i64, i64) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16

emitc.func @foo13() -> i16 
{
    %zero = emitc.literal "0.0F" : i64
    %hundred = emitc.literal "100.0F" : i64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i64} : () -> i64
    "emitc.assign"(%data, %zero): (i64, i64) -> ()
    %result = emitc.div %hundred, %data : (i64, i64) -> i16
    emitc.return %result: i16
}

// CHECK-LABEL: emitc.func @foo14() -> i16
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func14(%{{.*}}, %{{.*}}) : (f32, f32) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16

emitc.func @foo14() -> i16 
{
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    %result = emitc.div %hundred, %data : (f32, f32) -> i16
    emitc.return %result: i16
}

// CHECK-LABEL: emitc.func @foo15() -> i16
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func15(%{{.*}}, %{{.*}}) : (f64, f64) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16

emitc.func @foo15() -> i16 
{
    %zero = emitc.literal "0.0F" : f64
    %hundred = emitc.literal "100.0F" : f64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f64} : () -> f64
    "emitc.assign"(%data, %zero): (f64, f64) -> ()
    %result = emitc.div %hundred, %data : (f64, f64) -> i16
    emitc.return %result: i16
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo16() -> i32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func16(%{{.*}}, %{{.*}}) : (i8, i8) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32

emitc.func @foo16() -> i32 
{
    %zero = emitc.literal "0.0F" : i8
    %hundred = emitc.literal "100.0F" : i8
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i8} : () -> i8
    "emitc.assign"(%data, %zero): (i8, i8) -> ()
    %result = emitc.div %hundred, %data : (i8, i8) -> i32
    emitc.return %result: i32
}

// CHECK-LABEL: emitc.func @foo17() -> i32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func17(%{{.*}}, %{{.*}}) : (i16, i16) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32

emitc.func @foo17() -> i32 
{
    %zero = emitc.literal "0.0F" : i16
    %hundred = emitc.literal "100.0F" : i16
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i16} : () -> i16
    "emitc.assign"(%data, %zero): (i16, i16) -> ()
    %result = emitc.div %hundred, %data : (i16, i16) -> i32
    emitc.return %result: i32
}

// CHECK-LABEL: emitc.func @foo18() -> i32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func18(%{{.*}}, %{{.*}}) : (i64, i64) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32

emitc.func @foo18() -> i32 
{
    %zero = emitc.literal "0.0F" : i64
    %hundred = emitc.literal "100.0F" : i64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i64} : () -> i64
    "emitc.assign"(%data, %zero): (i64, i64) -> ()
    %result = emitc.div %hundred, %data : (i64, i64) -> i32
    emitc.return %result: i32
}

// CHECK-LABEL: emitc.func @foo19() -> i32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func19(%{{.*}}, %{{.*}}) : (f32, f32) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32

emitc.func @foo19() -> i32 
{
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    %result = emitc.div %hundred, %data : (f32, f32) -> i32
    emitc.return %result: i32
}

// CHECK-LABEL: emitc.func @foo20() -> i32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func20(%{{.*}}, %{{.*}}) : (f64, f64) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32

emitc.func @foo20() -> i32 
{
    %zero = emitc.literal "0.0F" : f64
    %hundred = emitc.literal "100.0F" : f64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f64} : () -> f64
    "emitc.assign"(%data, %zero): (f64, f64) -> ()
    %result = emitc.div %hundred, %data : (f64, f64) -> i32
    emitc.return %result: i32
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo21() -> i64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func21(%{{.*}}, %{{.*}}) : (i8, i8) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64

emitc.func @foo21() -> i64 
{
    %zero = emitc.literal "0.0F" : i8
    %hundred = emitc.literal "100.0F" : i8
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i8} : () -> i8
    "emitc.assign"(%data, %zero): (i8, i8) -> ()
    %result = emitc.div %hundred, %data : (i8, i8) -> i64
    emitc.return %result: i64
}

// CHECK-LABEL: emitc.func @foo22() -> i64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func22(%{{.*}}, %{{.*}}) : (i16, i16) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64

emitc.func @foo22() -> i64 
{
    %zero = emitc.literal "0.0F" : i16
    %hundred = emitc.literal "100.0F" : i16
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i16} : () -> i16
    "emitc.assign"(%data, %zero): (i16, i16) -> ()
    %result = emitc.div %hundred, %data : (i16, i16) -> i64
    emitc.return %result: i64
}

// CHECK-LABEL: emitc.func @foo23() -> i64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func23(%{{.*}}, %{{.*}}) : (i32, i32) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64

emitc.func @foo23() -> i64 
{
    %zero = emitc.literal "0.0F" : i32
    %hundred = emitc.literal "100.0F" : i32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data, %zero): (i32, i32) -> ()
    %result = emitc.div %hundred, %data : (i32, i32) -> i64
    emitc.return %result: i64
}

// CHECK-LABEL: emitc.func @foo24() -> i64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func24(%{{.*}}, %{{.*}}) : (f32, f32) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64

emitc.func @foo24() -> i64 
{
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    %result = emitc.div %hundred, %data : (f32, f32) -> i64
    emitc.return %result: i64
}

// CHECK-LABEL: emitc.func @foo25() -> i64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func25(%{{.*}}, %{{.*}}) : (f64, f64) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64

emitc.func @foo25() -> i64 
{
    %zero = emitc.literal "0.0F" : f64
    %hundred = emitc.literal "100.0F" : f64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f64} : () -> f64
    "emitc.assign"(%data, %zero): (f64, f64) -> ()
    %result = emitc.div %hundred, %data : (f64, f64) -> i64
    emitc.return %result: i64
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo26() -> f32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func26(%{{.*}}, %{{.*}}) : (i8, i8) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32

emitc.func @foo26() -> f32 
{
    %zero = emitc.literal "0.0F" : i8
    %hundred = emitc.literal "100.0F" : i8
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i8} : () -> i8
    "emitc.assign"(%data, %zero): (i8, i8) -> ()
    %result = emitc.div %hundred, %data : (i8, i8) -> f32
    emitc.return %result: f32
}

// CHECK-LABEL: emitc.func @foo27() -> f32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func27(%{{.*}}, %{{.*}}) : (i16, i16) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32

emitc.func @foo27() -> f32 
{
    %zero = emitc.literal "0.0F" : i16
    %hundred = emitc.literal "100.0F" : i16
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i16} : () -> i16
    "emitc.assign"(%data, %zero): (i16, i16) -> ()
    %result = emitc.div %hundred, %data : (i16, i16) -> f32
    emitc.return %result: f32
}

// CHECK-LABEL: emitc.func @foo28() -> f32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func28(%{{.*}}, %{{.*}}) : (i32, i32) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32

emitc.func @foo28() -> f32 
{
    %zero = emitc.literal "0.0F" : i32
    %hundred = emitc.literal "100.0F" : i32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data, %zero): (i32, i32) -> ()
    %result = emitc.div %hundred, %data : (i32, i32) -> f32
    emitc.return %result: f32
}

// CHECK-LABEL: emitc.func @foo29() -> f32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func29(%{{.*}}, %{{.*}}) : (i64, i64) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32

emitc.func @foo29() -> f32 
{
    %zero = emitc.literal "0.0F" : i64
    %hundred = emitc.literal "100.0F" : i64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i64} : () -> i64
    "emitc.assign"(%data, %zero): (i64, i64) -> ()
    %result = emitc.div %hundred, %data : (i64, i64) -> f32
    emitc.return %result: f32
}

// CHECK-LABEL: emitc.func @foo30() -> f32
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func30(%{{.*}}, %{{.*}}) : (f64, f64) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32

emitc.func @foo30() -> f32 
{
    %zero = emitc.literal "0.0F" : f64
    %hundred = emitc.literal "100.0F" : f64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f64} : () -> f64
    "emitc.assign"(%data, %zero): (f64, f64) -> ()
    %result = emitc.div %hundred, %data : (f64, f64) -> f32
    emitc.return %result: f32
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo31() -> f64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func31(%{{.*}}, %{{.*}}) : (i8, i8) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64

emitc.func @foo31() -> f64 
{
    %zero = emitc.literal "0.0F" : i8
    %hundred = emitc.literal "100.0F" : i8
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i8} : () -> i8
    "emitc.assign"(%data, %zero): (i8, i8) -> ()
    %result = emitc.div %hundred, %data : (i8, i8) -> f64
    emitc.return %result: f64
}

// CHECK-LABEL: emitc.func @foo32() -> f64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func32(%{{.*}}, %{{.*}}) : (i16, i16) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64

emitc.func @foo32() -> f64 
{
    %zero = emitc.literal "0.0F" : i16
    %hundred = emitc.literal "100.0F" : i16
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i16} : () -> i16
    "emitc.assign"(%data, %zero): (i16, i16) -> ()
    %result = emitc.div %hundred, %data : (i16, i16) -> f64
    emitc.return %result: f64
}

// CHECK-LABEL: emitc.func @foo33() -> f64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func33(%{{.*}}, %{{.*}}) : (i32, i32) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64

emitc.func @foo33() -> f64 
{
    %zero = emitc.literal "0.0F" : i32
    %hundred = emitc.literal "100.0F" : i32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data, %zero): (i32, i32) -> ()
    %result = emitc.div %hundred, %data : (i32, i32) -> f64
    emitc.return %result: f64
}

// CHECK-LABEL: emitc.func @foo34() -> f64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func34(%{{.*}}, %{{.*}}) : (i64, i64) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64

emitc.func @foo34() -> f64 
{
    %zero = emitc.literal "0.0F" : i64
    %hundred = emitc.literal "100.0F" : i64
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i64} : () -> i64
    "emitc.assign"(%data, %zero): (i64, i64) -> ()
    %result = emitc.div %hundred, %data : (i64, i64) -> f64
    emitc.return %result: f64
}

// CHECK-LABEL: emitc.func @foo35() -> f64
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func35(%{{.*}}, %{{.*}}) : (f32, f32) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64

emitc.func @foo35() -> f64 
{
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    %result = emitc.div %hundred, %data : (f32, f32) -> f64
    emitc.return %result: f64
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo36() -> f64
// CHECK: %[[RET1:.*]] = emitc.call @wrapped_div_func36(%{{.*}}, %{{.*}}) : (i32, i32) -> f64
// CHECK: %[[RET2:.*]] = emitc.call @wrapped_div_func37(%{{.*}}, %{{.*}}) : (f32, f32) -> f64
// CHECK-NEXT: emitc.return %[[RET2]] : f64

emitc.func @foo36() -> f64 
{
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()

    %zero1 = emitc.literal "0.0F" : i32
    %hundred1 = emitc.literal "100.0F" : i32
    %data1 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data1, %zero1): (i32, i32) -> ()


    %result1 = emitc.div %hundred1, %data1 : (i32, i32) -> f64
    %result = emitc.div %hundred, %data : (f32, f32) -> f64
    emitc.return %result: f64
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo37() -> f64
// CHECK: %[[RET1:.*]] = emitc.call @wrapped_div_func38(%{{.*}}, %{{.*}}) : (i64, i32) -> f64
// CHECK: %[[RET2:.*]] = emitc.call @wrapped_div_func39(%{{.*}}, %{{.*}}) : (i32, i32) -> f64
// CHECK: %[[RET3:.*]] = emitc.call @wrapped_div_func40(%{{.*}}, %{{.*}}) : (f32, f32) -> f64
// CHECK-NEXT: emitc.return %[[RET1]] : f64

emitc.func @foo37() -> f64 
{
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()

    %zero1 = emitc.literal "0.0F" : i32
    %hundred1 = emitc.literal "100.0F" : i32
    %data1 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data1, %zero1): (i32, i32) -> ()

    %zero2 = emitc.literal "0.0F" : i32
    %hundred2 = emitc.literal "100.0F" : i64
    %data2 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data2, %zero2): (i32, i32) -> ()
    %result2 = emitc.div %hundred2, %data2 : (i64, i32) -> f64

    %result1 = emitc.div %hundred1, %data1 : (i32, i32) -> f64
    %result = emitc.div %hundred, %data : (f32, f32) -> f64
    emitc.return %result2: f64
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo38() -> f64
// CHECK: %[[VAL7:.*]] = emitc.call @wrapped_div_func41(%{{.*}}, %{{.*}}) : (f32, f32) -> f64
// CHECK: %[[VAL8:.*]] = emitc.call @wrapped_div_func42(%{{.*}}, %{{.*}}) : (i32, i32) -> f64

emitc.func @foo38() -> f64 
{
    %zero1 = emitc.literal "0.0F" : f32
    %hundred1 = emitc.literal "100.0F" : f32
    %data1 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data1, %zero1): (f32, f32) -> ()

    %zero2 = emitc.literal "0.0F" : i32
    %hundred2 = emitc.literal "100.0F" : i32
    %data2 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data2, %zero2): (i32, i32) -> ()

    %ret = "emitc.variable"(){value = #emitc.opaque<"100.0F"> : f64} : () -> f64

    %branch = emitc.literal "0" : i1

    emitc.if %branch {
        %result1 = emitc.div %hundred1, %data1 : (f32, f32) -> f64
        "emitc.assign"(%ret, %result1): (f64, f64) -> ()
    } else {
        %result2 = emitc.div %hundred2, %data2 : (i32, i32) -> f64
        "emitc.assign"(%ret, %result2): (f64, f64) -> ()
    }
    emitc.return %ret: f64
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo39() -> i8
// CHECK: %[[VAL7:.*]] = emitc.call @wrapped_div_func43(%[[ARG1:.*]], %[[ARG2:.*]]) : (f32, i32) -> i8
// CHECK-NOT: [[VAL7]] = emitc.div %[[ARG1]], %[[ARG2]] : (f32, i32) -> i8
// CHECK: %[[VAL8:.*]] = emitc.call @wrapped_div_func44(%[[ARG3:.*]], %[[ARG4:.*]]) : (i32, f32) -> i8
// CHECK-NOT: [[VAL8]] = emitc.div %[[ARG3]], %[[ARG4]] : (f32, i32) -> i8
// CHECK: %[[VAL9:.*]] = emitc.call @wrapped_div_func45(%[[ARG5:.*]], %[[ARG6:.*]]) : (f32, f32) -> i8
// CHECK-NOT: [[VAL9]] = emitc.div %[[ARG5]], %[[ARG6]] : (f32, i32) -> i8
// CHECK: %[[VAL10:.*]] = emitc.call @wrapped_div_func46(%[[ARG7:.*]], %[[ARG8:.*]]) : (i32, i32) -> i8
// CHECK-NOT: [[VAL10]] = emitc.div %[[ARG7]], %[[ARG8]] : (f32, i32) -> i8

emitc.func @foo39() -> i8 
{
    %zero1 = emitc.literal "0.0F" : f32
    %hundred1 = emitc.literal "100.0F" : f32
    %data1 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data1, %zero1): (f32, f32) -> ()

    %zero2 = emitc.literal "0.0F" : i32
    %hundred2 = emitc.literal "100.0F" : i32
    %data2 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i32} : () -> i32
    "emitc.assign"(%data2, %zero2): (i32, i32) -> ()

    %ret = "emitc.variable"(){value = #emitc.opaque<"100.0F"> : i8} : () -> i8

    %branch = emitc.literal "0" : i1

    emitc.if %branch {
        %branch1 = emitc.literal "1" : i1
        emitc.if %branch {
            %result1 = emitc.div %hundred1, %data2 : (f32, i32) -> i8
            "emitc.assign"(%ret, %result1): (i8, i8) -> ()
        } else {
            %result2 = emitc.div %hundred2, %data1 : (i32, f32) -> i8
            "emitc.assign"(%ret, %result2): (i8, i8) -> ()
        }
    } else {
        %branch2 = emitc.literal "0" : i1
        emitc.if %branch2 {
            %result1 = emitc.div %hundred1, %data1 : (f32, f32) -> i8
            "emitc.assign"(%ret, %result1): (i8, i8) -> ()
        } else {
            %result2 = emitc.div %hundred2, %data2 : (i32, i32) -> i8
            "emitc.assign"(%ret, %result2): (i8, i8) -> ()
        }
    }
    emitc.return %ret: i8
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo41() -> i16
// CHECK: %[[VAL7:.*]] = emitc.call @wrapped_div_func47(%[[ARG1:.*]], %[[ARG2:.*]]) : (i8, i8) -> i16
// CHECK-NOT: [[VAL7]] = emitc.div %[[ARG1]], %[[ARG2]] : (i8, i8) -> i16
// CHECK: %[[VAL8:.*]] = emitc.call @wrapped_div_func48(%[[ARG2]], %[[ARG1]]) : (i8, i8) -> i16
// CHECK-NOT: [[VAL8]] = emitc.div %[[ARG2]], %[[ARG1]] : (i8, i8) -> i16

emitc.func @foo41() -> i16 
{
    %zero1 = emitc.literal "0.0F" : i8
    %hundred1 = emitc.literal "100.0F" : i8
    %data1 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : i8} : () -> i8
    "emitc.assign"(%data1, %zero1): (i8, i8) -> ()

    %ret = "emitc.variable"(){value = #emitc.opaque<"100.0F"> : i16} : () -> i16

    %branch1 = emitc.literal "1" : i1
    emitc.if %branch1 {
        %result1 = emitc.div %data1, %hundred1 : (i8, i8) -> i16
        "emitc.assign"(%ret, %result1): (i16, i16) -> ()
    } else {
        %result2 = emitc.div %hundred1, %data1 : (i8, i8) -> i16
        "emitc.assign"(%ret, %result2): (i16, i16) -> ()
    }

    emitc.return %ret: i16
}

// CHECK-LABEL: emitc.func @foo40() -> i16
// CHECK: %[[RET:.*]] = emitc.call @foo41() : () -> i16
// CHECK: emitc.return %[[RET]] : i16

emitc.func @foo40() -> i16 
{
    %ret = emitc.call @foo41() : () -> i16
    emitc.return %ret: i16
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo42() -> i64
// CHECK: %[[RET2:.*]] = emitc.call @wrapped_div_func49(%[[ARG1:.*]], %[[ARG2:.*]]) : (i32, i32) -> i64
// CHECK-NOT: %[[RET2]] = emitc.div %[[ARG1]], %[[ARG2]] : (i32, i32) -> i64

emitc.func @foo42() -> i64 
{
    %a = emitc.literal "23" : i32
    %b = emitc.literal "100" : i32
    %c = emitc.literal "56" : i32
    %d = emitc.literal "65" : i32

    %ret = emitc.expression : i64 {
    %0 = emitc.add %a, %b : (i32, i32) -> i32
    %2 = emitc.add %c, %d : (i32, i32) -> i32
    %3 = emitc.div %0, %2 : (i32, i32) -> i64
    emitc.yield %3 : i64
    }
    emitc.return %ret: i64
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo43() -> i16
// CHECK: %[[RES1:.*]] = emitc.call @wrapped_div_func50(%[[ARG1:.*]], %[[ARG2:.*]]) : (i64, i64) -> i16
// CHECK-NOT: %[[RES1]] = emitc.div %[[ARG1]], %[[ARG2]] : (i64, i64) -> i16
// CHECK: %[[RES2:.*]] = emitc.call @wrapped_div_func51(%[[ARG2]], %[[ARG1]]) : (i64, i64) -> i16
// CHECK-NOT: %[[RES2]] = emitc.div %[[ARG2]], %[[ARG1]] : (i64, i64) -> i16

emitc.func @foo43() -> i16 
{
    %a = emitc.literal "23" : i64
    %b = emitc.literal "100" : i64
    %c = emitc.literal "56" : i64
    %d = emitc.literal "65" : i64

    %ret = "emitc.variable"(){value = #emitc.opaque<"100.0F"> : i16} : () -> i16
    %branch1 = emitc.literal "1" : i1
    emitc.if %branch1 {
        %res1 = emitc.expression : i16 {
        %0 = emitc.add %a, %b : (i64, i64) -> i64
        %2 = emitc.add %c, %d : (i64, i64) -> i64
        %3 = emitc.div %0, %2 : (i64, i64) -> i16
        emitc.yield %3 : i16
        }
        "emitc.assign"(%ret, %res1): (i16, i16) -> ()
    } else {
        %res2 = emitc.expression : i16 {
        %0 = emitc.add %a, %b : (i64, i64) -> i64
        %2 = emitc.add %c, %d : (i64, i64) -> i64
        %3 = emitc.div %2, %0 : (i64, i64) -> i16
        emitc.yield %3 : i16
        }
        "emitc.assign"(%ret, %res2): (i16, i16) -> ()
    }
    emitc.return %ret: i16
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo44(%{{.*}}: i32, %{{.*}}: i32) -> f64
// CHECK: %[[RES:.*]] = emitc.call @wrapped_div_func52(%[[ARG1:.*]], %[[ARG2:.*]]) : (i32, i32) -> f64
// CHECK-NOT: %[[RES]] = emitc.div %[[ARG1]], %[[ARG2]] : (i32, i32) -> f64
// CHECK: emitc.return %{{.*}} : f64
emitc.func @foo44(%start: i32, %end: i32) -> f64
{
    %step_size = emitc.literal "1" : i32
    %div_arg2 = emitc.literal "2" : i32
    %res = "emitc.variable"(){value = #emitc.opaque<"100.0F"> : f64} : () -> f64
    emitc.for %i = %start to %end step %step_size : i32
    {
      %div_result = emitc.div %i, %div_arg2 : (i32, i32) -> f64
      "emitc.assign"(%res, %div_result): (f64, f64) -> ()
    }
    emitc.return %res: f64
}

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo45(%{{.*}}: i32, %{{.*}}: i32) -> f64
// CHECK: %[[RET:.*]] = "emitc.variable"() <{value = #emitc.opaque<"100.0F">}> : () -> f64
// CHECK: %[[RES1:.*]] = emitc.call @wrapped_div_func53(%[[ARG1:.*]], %[[ARG2:.*]]) : (i64, i64) -> f64
// CHECK-NOT: %[[RES1]] = emitc.div %[[ARG1]], %[[ARG2]] : (i64, i64) -> f64
// CHECK: %[[RES2:.*]] = emitc.call @wrapped_div_func54(%[[ARG2]], %[[ARG1]]) : (i64, i64) -> f64
// CHECK-NOT: %[[RES2]] = emitc.div %[[ARG2]], %[[ARG1]] : (i64, i64) -> f64
// CHECK: emitc.return %[[RET]] : f64

emitc.func @foo45(%start: i32, %end: i32) -> f64
{
    %a = emitc.literal "23" : i64
    %b = emitc.literal "100" : i64
    %c = emitc.literal "56" : i64
    %d = emitc.literal "65" : i64

    %step_size = emitc.literal "1" : i32
    %div_arg2 = emitc.literal "2" : i32
    %ret = "emitc.variable"(){value = #emitc.opaque<"100.0F"> : f64} : () -> f64

    emitc.for %i = %start to %end step %step_size : i32
    {
        %branch1 = emitc.literal "1" : i1
        emitc.if %branch1 {
        %res1 = emitc.expression : f64 {
        %0 = emitc.add %a, %b : (i64, i64) -> i64
        %2 = emitc.add %c, %d : (i64, i64) -> i64
        %3 = emitc.div %0, %2 : (i64, i64) -> f64
        emitc.yield %3 : f64
        }
        "emitc.assign"(%ret, %res1): (f64, f64) -> ()
        } else {
            %res2 = emitc.expression : f64 {
            %0 = emitc.add %a, %b : (i64, i64) -> i64
            %2 = emitc.add %c, %d : (i64, i64) -> i64
            %3 = emitc.div %2, %0 : (i64, i64) -> f64
            emitc.yield %3 : f64
            }
            "emitc.assign"(%ret, %res2): (f64, f64) -> ()
        }
    }
    emitc.return %ret: f64
}

// ----------------------------------------------------------------------------------------------------------------


