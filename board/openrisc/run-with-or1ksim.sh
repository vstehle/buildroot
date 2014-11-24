#!/bin/bash
set -eux

# Run the Linux system generated with buildroot on or1ksim on the PC.

./output/host/usr/bin/or1ksim \
	-f output/host/usr/share/openrisc/or1ksim.cfg \
	--verbose \
	output/images/vmlinux

#	--trace \
#	--trace-physical \
#	--trace-virtual \
