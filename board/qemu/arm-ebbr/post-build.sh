#!/bin/sh
set -eu

# Mount efivarfs
FSTAB="${TARGET_DIR}/etc/fstab"

if [ -e "$FSTAB" ] && ! grep -qE efivarfs "$FSTAB"; then
	cat >>"$FSTAB" <<END
efivarfs	/sys/firmware/efi/efivars	efivarfs	defaults	0	0
END
fi
