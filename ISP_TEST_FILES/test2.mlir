emitc.func @foo() -> f32 {
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32

    %one = emitc.literal "0.0F" : f32
    %two = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    %data1 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    %data2 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32


    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    "emitc.assign"(%data2, %one): (f32, f32) -> ()
    "emitc.assign"(%data1, %two): (f32, f32) -> ()

    %result = emitc.div %hundred, %data : (f32, f32) -> f32
    %result1 = emitc.div %hundred, %data2 : (f32, f32) -> f32
    %result2 = emitc.div %hundred, %data1 : (f32, f32) -> f32
      %result4 = emitc.div %hundred, %data1 : (f32, f32) -> f32
    emitc.return %result: f32
}

emitc.func @foo_1() -> f32 {
    %zero = emitc.literal "0.0F" : f32
    %hundred = emitc.literal "100.0F" : f32

    %one = emitc.literal "0.0F" : f32
    %two = emitc.literal "100.0F" : f32
    %data = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    %data1 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32
    %data2 = "emitc.variable"(){value = #emitc.opaque<"2.0F"> : f32} : () -> f32


    "emitc.assign"(%data, %zero): (f32, f32) -> ()
    "emitc.assign"(%data2, %one): (f32, f32) -> ()
    "emitc.assign"(%data1, %two): (f32, f32) -> ()

    %result = emitc.div %hundred, %data : (f32, f32) -> f32
    %result1 = emitc.div %hundred, %data2 : (f32, f32) -> f32
    %result2 = emitc.div %hundred, %data1 : (f32, f32) -> f32
      %result4 = emitc.div %hundred, %data1 : (f32, f32) -> f32
    emitc.return %result: f32
}