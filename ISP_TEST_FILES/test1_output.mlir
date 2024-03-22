module {
  emitc.func @foo() -> f32 {
    %1 = emitc.literal "0.0F" : f32
    %2 = emitc.literal "100.0F" : f32
    %3 = "emitc.variable"() <{value = #emitc.opaque<"2.0F">}> : () -> f32
    emitc.assign %1 : f32 to %3 : f32
    %4 = emitc.div %2, %3 : (f32, f32) -> f32
    emitc.return %4 : f32
  }
  %0 = "emitc.constant"() <{value = 42 : i32}> : () -> i32
}

