Introduction
============

The rockpro64_ebbr_defconfig is meant to illustrate some aspects of the Arm EBBR
specification[1] and the Arm SystemReady IR[2] compliance program.
It allows building an AArch64 U-Boot based firmware implementing the subset of
UEFI defined by EBBR, as well as a Linux OS disk image booting with UEFI, to run
on the PINE64 ROCKPro64.

Building
========

  $ make rockpro64_ebbr_defconfig
  $ make

Generated files under output/images:

* disk.img: An eMMC or SD card disk image comprising TF-A, OP-TEE, the U-Boot
  bootloader, the GRUB bootloader, the Linux kernel and the root filesystem.

* u-boot-rockchip-spi.bin: A firmware image suitable for flashing in SPI NOR
  comprising TF-A, OP-TEE and the U-Boot bootloader.


TBD
===

Serial console:
---------------
The pin layout for serial console on PI-2 GPIO Bus is as follows:

pin 6:  gnd
pin 8:  tx
pin 10: rx

Initially connect pin 6 and pin 8(transmit). Apply power to RockPro64, once the
power is on then connect pin 10(receive).

Baudrate for this board is 1500000.

Miscellaneous
=============

This configuration is inspired by the rockpro64_defconfig
TBD
the qemu_aarch64_virt_defconfig, the
aarch64_efi_defconfig and the Arm SystemReady IR IoT Integration, Test, and
Certification Guide[4].

TBD
U-Boot env in SPI NOR

Firmware update is currently not supported.

[1]: https://github.com/ARM-software/ebbr
[2]: https://developer.arm.com/Architectures/Arm%20SystemReady%20IR
[3]: https://github.com/ARM-software/arm-systemready/tree/main/IR/prebuilt_images
[4]: https://developer.arm.com/documentation/DUI1101/latest/

TBD https://www.pine64.org/rockpro64/
TBD https://wiki.pine64.org/wiki/RK3399_boot_sequence
