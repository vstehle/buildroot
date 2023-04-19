#!/bin/sh
set -eu

BOARD_DIR=$(dirname "$0")

# Generate signed capsule binaries
cp -vf "${BOARD_DIR}/capsule.its" "${BINARIES_DIR}/capsule.its"
(cd "${BINARIES_DIR}" && mkimage -f capsule.its capsule.itb)

# Generate certificates but avoid overwriting
if [ ! -e "${BINARIES_DIR}/CRT.key" ] || [ ! -e "${BINARIES_DIR}/CRT.crt" ] \
	|| [ ! -e "${BINARIES_DIR}/CRT.esl" ]; \
then
	openssl req -x509 -sha256 -newkey rsa:2048 -subj /CN=CRT/ \
		-keyout "${BINARIES_DIR}/CRT.key" \
		-out "${BINARIES_DIR}/CRT.crt" -nodes -days 365

	cert-to-efi-sig-list "${BINARIES_DIR}/CRT.crt" \
		"${BINARIES_DIR}/CRT.esl"
fi

mkeficapsule \
	--monotonic-count 1 \
	--private-key "${BINARIES_DIR}/CRT.key" \
	--certificate "${BINARIES_DIR}/CRT.crt" \
	--index 1 \
	--guid 058B7D83-50D5-4C47-A195-60D86AD341C4 \
	"${BINARIES_DIR}/capsule.itb" \
	"${BINARIES_DIR}/capsule.bin"

# Cab file
cp -vf "${BOARD_DIR}/metainfo.xml" "${BINARIES_DIR}/capsule.metainfo.xml"

(cd "${BINARIES_DIR}" && gcab -c -v connect23.cab capsule.bin \
	capsule.metainfo.xml)

# Signature dtb overlay
cp -vf "${BOARD_DIR}/signature.dts" "${BINARIES_DIR}/signature.dts"
(cd "${BINARIES_DIR}" && dtc -@ -I dts -O dtb -o signature.dtbo signature.dts)
