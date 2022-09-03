#!/bin/bash

MOUNT_NAME=$1

sudo mkdir -p "/mnt/$MOUNT_NAME"
sudo mount "$MOUNT_NAME.img" "/mnt/$MOUNT_NAME"