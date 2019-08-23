#!/bin/bash
set -eux

taskset 0x30 \
./output/host/bin/qemu-system-aarch64 \
	-append "console=ttyAMA0" \
	-cpu host \
	-enable-kvm \
	-initrd output/images/rootfs.cpio \
	-kernel output/images/Image \
	-m 1g \
	-machine virt \
	-nographic \
	-net none \
	-smp 2
