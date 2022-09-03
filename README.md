# UEFI-Bootloader

A Rust UEFI bootloader for x86-64. This is designed to be run on a linux system, some modification of
setup scripts will need to be done for Windows and macOS targets

## Install

You'll need run `./install.sh` to install the virtualisation packages and QEMU to run the EFI stack

## Test Mount Setup

It's easiest to create a test mount for running the bootloader in, this way the dev environment is kept
separate from the rest of your system.

Initially, you'll need to run `./build_fs.sh <mount name>` to perform the mount image setup, there are some
manual inputs that will need to be done, these are echoed at the start for you as reference

## Mounting FAT FS

Once your have built the mount image, you can mount it with `./mount_fs <mount name>`, making sure `<mount name>` is
the same as the one you provided during setup

## Unmounting FAT FS

If you want to unmount the FS at any stage, you can do so with `./unmount_fs <mount name>`, making sure `<mount name>` is
the same as the one you provided during setup

## Running Bootloader

There is a handy script called `./run.sh <mount path>` you can use to build and run the UEFI Bootloader inside of QEMU, assuming
you have done all the previous setup and configuration steps
