#![no_std]
#![no_main]
#![feature(abi_efiapi)]
use core::panic::PanicInfo;

mod uefi;
use uefi::*;

#[panic_handler]
fn panic(_info: &PanicInfo) -> ! {
    loop {}
}

#[no_mangle]
pub extern "efiapi" fn efi_main(handle: ImageHandle, system_table: *const SystemTable) {
    let string: &str = "hello\n\r";
    for c in string.chars() {
        let mut buffer: [u16; 1] = [0];
        let utf16: &mut [u16] = c.encode_utf16(&mut buffer);
        unsafe {
            let status = ((*(*system_table).output).output_string)(
                (*system_table).output,
                &utf16[0],
            );
        }
    }

    let string_arr = ['h' as u16, 'i' as u16, '!' as u16, '\n' as u16, '\0' as u16];
    unsafe {
        let status = ((*(*system_table).output).output_string)(
            (*system_table).output,
            &string_arr[0],
        );
    }
    loop {}
}
