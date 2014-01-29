#!/bin/bash

LOCATION="$(pwd)/buildroot/output/images"

KERNEL="bzImage"
DISK="rootfs.ext2"
				
qemu-system-x86_64 \
    -kernel $LOCATION/$KERNEL \
    -hda $LOCATION/$DISK \
    -boot c \
    -m 512 \
    -k en-us \
    -append "root=/dev/sda quiet" \
    -localtime \
    -name dockeros \
    -net nic -net tap,"helper=/usr/lib/qemu/qemu-bridge-helper"
