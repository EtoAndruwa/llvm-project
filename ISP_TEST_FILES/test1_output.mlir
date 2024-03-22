module {
  emitc.func @foo() -> f32 {
    %1 = emitc.literal "0.0F" : f32
    %2 = emitc.literal "100.0F" : f32
    %3 = emitc.literal "0.0F" : f32
    %4 = emitc.literal "100.0F" : f32
    %5 = "emitc.variable"() <{value = #emitc.opaque<"2.0F">}> : () -> f32
    %6 = "emitc.variable"() <{value = #emitc.opaque<"2.0F">}> : () -> f32
    %7 = "emitc.variable"() <{value = #emitc.opaque<"2.0F">}> : () -> f32
    emitc.assign %1 : f32 to %5 : f32
    emitc.assign %3 : f32 to %7 : f32
    emitc.assign %4 : f32 to %6 : f32
    %8 = emitc.div %2, %5 : (f32, f32) -> f32
    %9 = emitc.div %2, %7 : (f32, f32) -> f32
    %10 = emitc.div %2, %6 : (f32, f32) -> f32
    %11 = emitc.div %2, %6 : (f32, f32) -> f32
    emitc.return %8 : f32
  }
  emitc.func @foo_1() -> f32 {
    %1 = emitc.literal "0.0F" : f32
    %2 = emitc.literal "100.0F" : f32
    %3 = emitc.literal "0.0F" : f32
    %4 = emitc.literal "100.0F" : f32
    %5 = "emitc.variable"() <{value = #emitc.opaque<"2.0F">}> : () -> f32
    %6 = "emitc.variable"() <{value = #emitc.opaque<"2.0F">}> : () -> f32
    %7 = "emitc.variable"() <{value = #emitc.opaque<"2.0F">}> : () -> f32
    emitc.assign %1 : f32 to %5 : f32
    emitc.assign %3 : f32 to %7 : f32
    emitc.assign %4 : f32 to %6 : f32
    %8 = emitc.div %2, %5 : (f32, f32) -> f32
    %9 = emitc.div %2, %7 : (f32, f32) -> f32
    %10 = emitc.div %2, %6 : (f32, f32) -> f32
    %11 = emitc.div %2, %6 : (f32, f32) -> f32
    emitc.return %8 : f32
  }
  %0 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
}

