#!/bin/bash
set -eux

qemu-system-aarch64 \
	-machine virt,secure=on,virtualization=on \
	-cpu cortex-a53 \
	-bios output/images/flash.bin \
	-device virtio-blk-device,drive=hd0 \
	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
	-m 2048 \
	-no-acpi \
	-nographic \
	-d 'unimp,guest_errors' \
	-s

#./output/host/bin/qemu-system-aarch64 \
#../from-optee/qemu/build/aarch64-softmmu/qemu-system-aarch64 \
