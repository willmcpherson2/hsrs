fn main() {
    let crate_name = std::env::var("CARGO_PKG_NAME").unwrap();
    let crate_dir = std::env::var("CARGO_MANIFEST_DIR").unwrap();
    let header_path = std::path::PathBuf::from(format!("lib/{}.h", crate_name));

    cbindgen::Builder::new()
        .with_crate(crate_dir)
        .with_language(cbindgen::Language::C)
        .generate()
        .unwrap()
        .write_to_file(header_path);
}
