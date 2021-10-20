#!/bin/sh

set -eu

# Copy EFI binaries
BOARD_DIR="$(dirname "$0")"
cp -vf "${BOARD_DIR}/grub.cfg" "${BINARIES_DIR}/efi-part/EFI/BOOT/grub.cfg"

GRUB="${BINARIES_DIR}/efi-part/EFI/BOOT/grubaa64.efi"

if [ ! -e "$GRUB" ]; then
	mv -v "${BINARIES_DIR}/efi-part/EFI/BOOT/bootaa64.efi" "$GRUB"
fi

cp -vf "${BINARIES_DIR}/shimaa64.efi" "${BINARIES_DIR}/efi-part/EFI/BOOT/bootaa64.efi"

# Create flash.bin TF-A FIP image from bl1.bin and fip.bin
dd if="${BINARIES_DIR}/bl1.bin" of="${BINARIES_DIR}/flash.bin" bs=4096
dd if="${BINARIES_DIR}/fip.bin" of="${BINARIES_DIR}/flash.bin" seek=64 bs=4096 conv=notrunc

# Generate capsule binaries
cp -vf "${BOARD_DIR}/capsule.its" "${BINARIES_DIR}/capsule.its"
(cd "${BINARIES_DIR}" && mkimage -f capsule.its capsule.itb)
mkeficapsule --fit "${BINARIES_DIR}/capsule.itb" "${BINARIES_DIR}/capsule.bin"
