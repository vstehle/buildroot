#!/bin/bash
set -eux

taskset 0x30 \
./output/host/bin/qemu-system-aarch64 \
	-append "console=ttyAMA0 debug" \
	-cpu host \
	-dtb output/images/qemu.dtb \
	-enable-kvm \
	-initrd output/images/rootfs.cpio \
	-kernel output/images/Image \
	-m 1g \
	-machine virt \
	-net none \
	-nographic \
	-smp 2
