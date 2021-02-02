#!/bin/bash
set -eux

cd output/images

qemu-system-arm \
	-bios bl1.bin \
	-cpu cortex-a15 \
	-d unimp \
	-m 1024 \
	-machine virt,secure=on \
	-net none \
	-semihosting-config enable,target=native \
	-serial stdio \
	-smp 1 \
	|& tee ../../qemu.log
