use std::fs::File;
use std::io::Write;

fn main() {
    println!("cargo:rerun-if-changed=../wasm-libraries/forward");
    let mut out = Vec::new();
    forward::forward_stub(&mut out).expect("Failed to write stub");
    let out_dir = std::env::var("OUT_DIR").unwrap();
    let mut file = File::create(format!("{out_dir}/forward_stub.wat")).unwrap();
    file.write_all(&out).unwrap();
}