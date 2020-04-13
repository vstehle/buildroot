#!/bin/sh
# Create the necessary WiFi firmware symbolic links for the brcmfmac driver
set -eu

cd "$1/lib/firmware"
[ -d brcm ] || mkdir -v brcm
cd brcm
ln -svf ../ap6212/nvram.txt brcmfmac43430-sdio.sinovoip,bpi-m2-zero.txt
ln -svf ../ap6212/fw_bcm43438a1_apsta.bin brcmfmac43430-sdio.bin
