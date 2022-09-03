#!/bin/bash

MOUNT_NAME=$1

sudo unmount "/mnt/$MOUNT_NAME"
sudo rmdir -f "/mnt/$MOUNT_NAME"