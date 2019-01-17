#[no_mangle]
pub extern "C" fn toto(x: i32) -> i32 {
    x * 2
}

#[no_mangle]
pub extern "C" fn triple(x: i32) -> i32 {
    x * 3
}