// RUN: mlir-opt %s -div-to-outer-func -verify-diagnostics | FileCheck %s

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func35(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(f64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func34(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(f64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func33(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(f64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func32(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(f64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func31(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(f64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func30(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(f32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func29(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(f32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func28(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(f32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func27(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(f32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func26(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(f32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func25(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(i64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func24(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func23(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func22(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(i64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func21(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func20(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(i32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func19(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func18(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(i32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func17(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(i32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func16(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func15(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(i16)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func14(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i16)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func13(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(i16)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func12(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i16)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func11(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i16)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func10(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(i8)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func9(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(i8)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func8(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(i8)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func7(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i8)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func6(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(i8)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @wrapped_div_func5(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f64)]], %[[ARG2:.*]]: [[TYPE2:(f64)]]) -> [[RET_TYPE:(f64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func4(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(f32)]], %[[ARG2:.*]]: [[TYPE2:(f32)]]) -> [[RET_TYPE:(f32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func3(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i64)]], %[[ARG2:.*]]: [[TYPE2:(i64)]]) -> [[RET_TYPE:(i64)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func2(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i32)]], %[[ARG2:.*]]: [[TYPE2:(i32)]]) -> [[RET_TYPE:(i32)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func1(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i16)]], %[[ARG2:.*]]: [[TYPE2:(i16)]]) -> [[RET_TYPE:(i16)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// CHECK-LABEL: emitc.func @wrapped_div_func0(
// CHECK-SAME: %[[ARG1:.*]]: [[TYPE1:(i8)]], %[[ARG2:.*]]: [[TYPE2:(i8)]]) -> [[RET_TYPE:(i8)]] {
// CHECK: %[[RET:.*]] = emitc.div %[[ARG1]], %[[ARG2]] : ([[TYPE1]], [[TYPE2]]) -> [[RET_TYPE]]
// CHECK-NEXT: emitc.return %[[RET]] : [[RET_TYPE]]
// CHECK-NEXT: }

// ----------------------------------------------------------------------------------------------------------------

// CHECK-LABEL: emitc.func @foo0() -> i8
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func0(%{{.*}}, %{{.*}}) : (i8, i8) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func1(%{{.*}}, %{{.*}}) : (i16, i16) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func2(%{{.*}}, %{{.*}}) : (i32, i32) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func3(%{{.*}}, %{{.*}}) : (i64, i64) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func4(%{{.*}}, %{{.*}}) : (f32, f32) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func5(%{{.*}}, %{{.*}}) : (f64, f64) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func6(%{{.*}}, %{{.*}}) : (i16, i16) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func7(%{{.*}}, %{{.*}}) : (i32, i32) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func8(%{{.*}}, %{{.*}}) : (i64, i64) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func9(%{{.*}}, %{{.*}}) : (f32, f32) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func10(%{{.*}}, %{{.*}}) : (f64, f64) -> i8
// CHECK-NEXT: emitc.return %[[RET]] : i8
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func11(%{{.*}}, %{{.*}}) : (i8, i8) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func12(%{{.*}}, %{{.*}}) : (i32, i32) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func13(%{{.*}}, %{{.*}}) : (i64, i64) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func14(%{{.*}}, %{{.*}}) : (f32, f32) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func15(%{{.*}}, %{{.*}}) : (f64, f64) -> i16
// CHECK-NEXT: emitc.return %[[RET]] : i16
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func16(%{{.*}}, %{{.*}}) : (i8, i8) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func17(%{{.*}}, %{{.*}}) : (i16, i16) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func18(%{{.*}}, %{{.*}}) : (i64, i64) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func19(%{{.*}}, %{{.*}}) : (f32, f32) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func20(%{{.*}}, %{{.*}}) : (f64, f64) -> i32
// CHECK-NEXT: emitc.return %[[RET]] : i32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func21(%{{.*}}, %{{.*}}) : (i8, i8) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func22(%{{.*}}, %{{.*}}) : (i16, i16) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func23(%{{.*}}, %{{.*}}) : (i32, i32) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func24(%{{.*}}, %{{.*}}) : (f32, f32) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func25(%{{.*}}, %{{.*}}) : (f64, f64) -> i64
// CHECK-NEXT: emitc.return %[[RET]] : i64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func26(%{{.*}}, %{{.*}}) : (i8, i8) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func27(%{{.*}}, %{{.*}}) : (i16, i16) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func28(%{{.*}}, %{{.*}}) : (i32, i32) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func29(%{{.*}}, %{{.*}}) : (i64, i64) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func30(%{{.*}}, %{{.*}}) : (f64, f64) -> f32
// CHECK-NEXT: emitc.return %[[RET]] : f32
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func31(%{{.*}}, %{{.*}}) : (i8, i8) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func32(%{{.*}}, %{{.*}}) : (i16, i16) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func33(%{{.*}}, %{{.*}}) : (i32, i32) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func34(%{{.*}}, %{{.*}}) : (i64, i64) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64
// CHECK-NEXT: }
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
// CHECK: { 
// CHECK: %[[RET:.*]] = emitc.call @wrapped_div_func35(%{{.*}}, %{{.*}}) : (f32, f32) -> f64
// CHECK-NEXT: emitc.return %[[RET]] : f64
// CHECK-NEXT: }
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

