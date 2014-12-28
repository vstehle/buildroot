#!/bin/bash
set -eux

# Run the Linux system generated with buildroot on the de0 nano.
# Notes:
# - You need to synthesize and download the orpsoc design first.
# - You need to connect a UART console to the board. TODO! Pins, etc...

export PATH="$PATH:$(pwd)/output/host/usr/bin"

set -m

openocd \
	--file ./output/host/usr/share/openocd/scripts/interface/altera-usb-blaster.cfg \
	--file board/altera/de0nano/altera-dev.tcl &

o=$!

or1k-linux-gdb \
	-x ./board/altera/de0nano/run.gdb \
	./output/images/vmlinux

kill $o
