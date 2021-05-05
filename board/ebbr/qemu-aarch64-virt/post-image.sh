#!/bin/bash
set -eu

FLASH_IMAGE="$BINARIES_DIR/nor_flash.bin"

echo "Generating $FLASH_IMAGE..."
dd if=/dev/zero of="$FLASH_IMAGE" count=$((64*1024*1024>>9))
dd if="$BINARIES_DIR/bl1.bin" of="$FLASH_IMAGE" bs=4096 conv=notrunc
dd if="$BINARIES_DIR/fip.bin" of="$FLASH_IMAGE" bs=4096 seek=64 conv=notrunc
