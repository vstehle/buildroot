#!/bin/sh
set -eu

# Add a console on tty1
if [ -e ${TARGET_DIR}/etc/inittab ]; then
    grep -qE '^tty1::' ${TARGET_DIR}/etc/inittab || \
	sed -i '/GENERIC_SERIAL/a\
tty1::respawn:/sbin/getty -L  tty1 0 vt100' ${TARGET_DIR}/etc/inittab
fi

BOARD_DIR="$(dirname $0)"
install -m 0644 -D $BOARD_DIR/extlinux.conf $BINARIES_DIR/boot/extlinux/extlinux.conf
