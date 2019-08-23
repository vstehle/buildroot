#!/bin/bash
set -eux

./output/host/bin/qemu-system-aarch64 \
	-append "console=ttyAMA0" \
	-cpu host \
	-enable-kvm \
	-initrd output/images/rootfs.cpio \
	-kernel output/images/Image \
	-m 1g \
	-machine virt \
	-net none \
	-nographic \
	-smp 2
