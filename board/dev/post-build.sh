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

# Create flash.bin
dd if=/dev/zero of="${BINARIES_DIR}/flash.bin" bs=1M count=64
dd if="${BINARIES_DIR}/u-boot.bin" of="${BINARIES_DIR}/flash.bin" bs=1M conv=notrunc

# Generate capsule binaries
cp -vf "${BOARD_DIR}/capsule.its" "${BINARIES_DIR}/capsule.its"
(cd "${BINARIES_DIR}" && mkimage -f capsule.its capsule.itb)
mkeficapsule --fit "${BINARIES_DIR}/capsule.itb" --index 1 "${BINARIES_DIR}/capsule.bin"
