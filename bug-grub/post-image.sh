#!/bin/sh

DIR="$(dirname $0)"

cp -f ${DIR}/grub.cfg ${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg

cd "$BINARIES_DIR"
rm -f flash.bin
dd if=bl1.bin of=flash.bin bs=4096 conv=notrunc
dd if=fip.bin of=flash.bin seek=64 bs=4096 conv=notrunc
