#!/bin/bash
set -eux

./output/host/bin/qemu-system-aarch64 \
	-smp 2 \
	-m 1g \
	-cpu host \
	-append "console=ttyAMA0" \
	-enable-kvm \
	-initrd output/images/rootfs.cpio \
	-kernel output/images/Image \
	-machine virt \
	-nographic
