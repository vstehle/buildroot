Introduction
============

The qemu_connect23_*_defconfig(s) are meant to demonstrate some aspects of the
Arm EBBR specification[1] and the Arm SystemReady IR[2] compliance program
during Linaro Connect 2023.
It allows building two AArch64 U-Boot based firmwares booting with UEFI, to run
on Qemu.

"Capsule update" configuration
==============================

Building
--------

  $ make qemu_connect23_capsule_defconfig
  $ make

Generated files under output/images:

* capsule.bin:    A signed UEFI capsule suitable for firmware update.
* connect23.cab:  A cabinet file containing the previous capsule, which can be
                  used by fwupdmgr.
* disk.img:       A disk image with an EFI System Partition for convenience.
* signature.dtbo: A devicetree overlay containing the sertificate corresponding
                  to the capsule.
* u-boot.bin:     A firmware image comprising the U-Boot bootloader.

Running under Qemu
------------------

Use the following command as the basis to run the emulation, with the additional
arguments mentioned below:

  qemu-system-aarch64 \
      -M virt \
      -bios output/images/u-boot.bin \
      -cpu cortex-a53 \
      -device virtio-blk-device,drive=hd1 \
      -device virtio-blk-device,drive=hd0 \
      -device virtio-net-device,netdev=eth0 \
      -device virtio-rng-device,rng=rng0 \
      -drive file=<distro iso>,if=none,format=raw,readonly=on,id=hd0 \
      -drive file=output/images/disk.img,if=none,format=raw,id=hd1 \
      -m 2048 \
      -netdev user,id=eth0 \
      -no-acpi \
      -nographic \
      -object rng-random,filename=/dev/urandom,id=rng0 \
      -rtc base=utc,clock=host \
      -smp 2

1. Run the emulation with the additional `-machine dumpdtb=dump.dtb` argument
   first, to capture the Devicetree.
2. Then merge the Devicetree certificate overlay with `fdtoverlay -i dump.dtb -o
   merged.dtb -v signature.dtbo`.
3. Finally, run the emulation with the additional `-dtb merged.dtb` argument.

The login prompt will appear in the terminal that started Qemu.

For capsule update "on disk" to work automatically, you will need to setup a
boot entry such as `Boot0000` refering to the ESP (`virtio 1`) and add it to the
`BootOrder` or `BootNext`.

"Secure boot" configuration
===========================

Building
--------

  $ make qemu_connect23_secboot_defconfig
  $ make

Generated files under output/images:

* flash.bin: A firmware image comprising TF-A, op-tee, StMM and the U-Boot
             bootloader.

Running under Qemu
------------------

Run the emulation with:

  qemu-system-aarch64 \
      -M virt,secure=on \
      -bios output/images/flash.bin \
      -cpu cortex-a53 \
      -device virtio-blk-device,drive=hd0 \
      -device virtio-net-device,netdev=eth0 \
      -device virtio-rng-device,rng=rng0 \
      -drive file=<acs-ir image>,if=none,format=raw,readonly=on,id=hd0 \
      -m 2048 \
      -netdev user,id=eth0 \
      -no-acpi \
      -nographic \
      -object rng-random,filename=/dev/urandom,id=rng0 \
      -rtc base=utc,clock=host \
      -semihosting \
      -smp 2

The login prompt will appear in the terminal that started Qemu.

Miscellaneous
=============

Those configurations are inspired by the qemu_aarch64_ebbr_defconfig, the Arm
SystemReady IR IoT Integration, Test, and Certification Guide[4] and the Linaro
LEDGE TRS releases.

[1]: https://github.com/ARM-software/ebbr
[2]: https://developer.arm.com/Architectures/Arm%20SystemReady%20IR
[3]: https://github.com/ARM-software/arm-systemready/tree/main/IR/prebuilt_images
[4]: https://developer.arm.com/documentation/DUI1101/1-1/?lang=en
