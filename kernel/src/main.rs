#![no_std]
#![no_main]

use core::panic::PanicInfo;

bootloader_api::entry_point!(kernel_main);

// the name kernel_main is arbitrary. we don't worry about mangling
// because of the macro bootloader::entry_point!()
fn kernel_main(_boot_info: &'static mut bootloader_api::BootInfo) -> ! {

    loop {}
}

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}