#!/bin/sh
set -eux

./output/host/usr/bin/qemu-system-aarch64 \
	-kernel output/images/Image \
	-initrd output/images/rootfs.cpio \
	-append console=ttyAMA0 \
	-machine virt \
	-cpu cortex-a57 \
	-nographic
