#!/bin/sh

set -eu

# Create flash.bin
dd if=/dev/zero of="${BINARIES_DIR}/flash.bin" bs=1M count=64
dd if="${BINARIES_DIR}/u-boot.bin" of="${BINARIES_DIR}/flash.bin" bs=1M conv=notrunc

# Generate capsule binaries
cp -vf board/dev/capsule.its "${BINARIES_DIR}/capsule.its"
(cd "${BINARIES_DIR}" && mkimage -f capsule.its capsule.itb)
mkeficapsule --fit "${BINARIES_DIR}/capsule.itb" --index 1 "${BINARIES_DIR}/capsule.bin"
