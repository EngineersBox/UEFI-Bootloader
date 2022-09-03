#!/bin/bash

MOUNT_NAME=$1

dd if=/dev/zero of="$MOUNT_NAME.img" count=50 bs=1M
echo "Use the following inputs for fdisk: o n <ENTER> <ENTER> t 1 c w"
fdisk "$MOUNT_NAME.img"
mkfs.vfat "$MOUNT_NAME.img"
