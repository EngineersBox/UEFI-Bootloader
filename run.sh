#!/bin/bash

MOUNT_PATH=$1

cargo +nightly build
sudo mkdir -p "$MOUNT_PATH/EFI/Boot"
sudo cp target/x86_64-unknown-uefi/debug/uefi_bootloader.efi "$MOUNT_PATH/EFI/Boot/Bootx64.efi"
qemu-system-x86_64.exe -L /usr/share/qemu -bios /usr/share/qemu/OVMF.fd -drive format=raw,file=fat:rw:$MOUNT_PATH