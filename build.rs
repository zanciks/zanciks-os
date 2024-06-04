use bootloader::DiskImageBuilder;
use std::{env, path::PathBuf};

fn main() {
    let kernel_path = env::var("CARGO_BIN_FILE_KERNEL").unwrap();
    let disk_builder = DiskImageBuilder::new(PathBuf::from(kernel_path));

    let out_dir = PathBuf::from(env::var("OUT_DIR").unwrap());
    let bios_path = out_dir.join("zanciks-os_bios.img");
    disk_builder.create_bios_image(&bios_path).unwrap();

    println!("cargo:rustc-env=BIOS_IMAGE={}", bios_path.display());
}