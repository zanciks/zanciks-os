use std::{
    env,
    process::{self, Command},
};

fn main() {
    /*
        So for command, we're essentially just running qemu in the terminal via that line
        we then give it the info it needs (drive-format, drive-file, etc)
        The drive-file comes from our BIOS_IMAGE environment variable!
    */
    let mut qemu = Command::new("qemu-system-x86_64");
    qemu.arg("--nographic");
    qemu.arg("--drive");
    qemu.arg(format!("format=raw,file={}", env!("BIOS_IMAGE")));
    let exit_status = qemu.status().unwrap();
    process::exit(exit_status.code().unwrap_or(-1));
}