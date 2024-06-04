use std::{env, fs};

fn main() {
    /*
        So we are getting the path of where we are running the code. This will either be in debug or release
        By using env::current_exe, we can get it at runtime. We then create a new EMPTY file NEXT to this one called
        "bios.img". Then we copy the info from our BIOS_IMAGE environment variable into that file for qemu!
    */
    let path = env::current_exe.unwrap();
    let target_bios = path.with_file_name("bios.img"); 
    fs::copy(env!("BIOS_IMAGE"), &target_bios).unwrap(); 
}