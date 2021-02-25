#!/bin/bash
set -eux

./output/host/bin/qemu-system-arm \
	-bios output/images/flash.bin \
	-cpu cortex-a15 \
	-d unimp \
	-drive file=output/images/disk.img,if=virtio,format=raw \
	-m 1000 \
	-machine virt,secure=on \
	-net none \
	-serial stdio \
	-smp 2
