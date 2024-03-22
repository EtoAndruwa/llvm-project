emitc.func @foo() -> f32 {
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    %result = emitc.div %hundred, %data : (f32, f32) -> f32
    emitc.return %result: f32
}