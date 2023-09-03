#!/bin/sh

# This scripts makes a minimal bootable SD card image for the Chromebook.
# The resulting file is called bootsd.img. It should be written directly
# to the card:
#
#	SD=/dev/mmcblk1		# check your device name!
#	dd if=output/images/bootsd.img of=$SD
#
# The partitions are created just large enough to hold the kernel image.
# Most of the card will be empty, and the secondary
# GPT will not be in its proper location.

# cgpt does not create protective MBR, and the kernel refuses to read
# GPT unless there's some kind of MBR in sector 0. So we need parted
# to write that single sector before doing anything with the GPT.
cgpt=$HOST_DIR/bin/cgpt
parted=$HOST_DIR/sbin/parted
kernel=$BINARIES_DIR/uImage.kpart

run() { echo "$@"; "$@"; }
die() { echo "$@" >&2; exit 1; }
test -f $kernel || die "No kernel image found"
test -x $cgpt || die "cgpt not found (host-vboot-utils have not been built?)"

# True file sizes in bytes
kernelsize=`stat -t $kernel | cut -d\  -f2`

# The card is partitioned in sectors of 8KB.
# 4 sectors are reserved for MBR+GPT. Their actual size turns out
# to be 33 512-blocks which is just over 2 sectors, but we align
# it to a nice round number.
sec=8192
kernelsec=$(((kernelsize+8191)>>13))
headersec=4

# There is also a copy of MBR+GPT at the end of the image.
# It's going to be useless but both tools assume it's there.
imagesec=$((2*headersec+kernelsec))
bootsd="$BINARIES_DIR/bootsd.img"
run dd bs=$sec count=$imagesec if=/dev/zero of=$bootsd

# cgpt needs offsets and sizes in 512-blocks.
block=512
kernelstart=$((headersec<<4))
kernelblocks=$((kernelsec<<4))

# This command initializes both GPT and MBR
run $parted -s $bootsd mklabel gpt

# The kernel partition must be marked as bootable, that's why -S -T -P
run $cgpt add -i 1 -b $kernelstart -s $kernelblocks \
	-t kernel -l kernel \
	-S 1 -T 1 -P 10 $bootsd

run dd bs=$block if=$kernel of=$bootsd seek=$kernelstart
