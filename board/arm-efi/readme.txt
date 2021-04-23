
The arm_efi_defconfig allows to build a minimal Linux system that
can boot on all 32b Arm v7A systems providing an EFI firmware.

This includes all 32b Arm EBBR[1] compliant systems, and all 32b Arm
SystemReady IR[2] compliant systems for example.


Building and booting
====================

$ make arm_efi_defconfig
$ make

The file output/images/disk.img is a complete disk image that can be
booted, it includes the grub2 bootloader, Linux kernel and root
filesystem.

Testing under Qemu
==================

This image can also be tested using Qemu:

qemu-system-arm \
	-M virt \
	-cpu cortex-a15 \
	-m 512 \
	-nographic \
	-bios </path/to/AAVMF32_CODE.fd> \
	-drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
	-device virtio-blk-device,drive=hd0 \
	-netdev user,id=eth0 \
	-device virtio-net-device,netdev=eth0

Note that </path/to/QEMU_EFI.fd> needs to point to a valid arm UEFI
firmware image for qemu.
It may be provided by your distribution as a edk2-TBD or AAVMF
package, in path such as /usr/share/AAVMF/AAVMF32_CODE.fd.

U-Boot based qemu firmware
==========================

TBD

Floating point support
======================

To maximize compatibility, the arm_efi_defconfig supports Cortex-A cores with
no hardware floating point support (soft float).

[1]: https://github.com/ARM-software/ebbr
[2]: https://developer.arm.com/architectures/system-architectures/arm-systemready
