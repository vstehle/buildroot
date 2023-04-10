#!/bin/sh
set -eu

# Image must be smaller than 32MB or it will not boot.
size_mb=$(du -m "${BINARIES_DIR}/Image" |sed 's/\t.*//')

if [ "$size_mb" -gt 32 ]; then
	echo "Image is too big! ($size_mb > 32 MB)" >&2
	exit 1
fi
