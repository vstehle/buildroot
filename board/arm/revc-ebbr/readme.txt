Introduction
============

This is the support for the ARM FVP Base RevC machine emulated by the
ARM software simulator of the AArch64 architecture.

First, one has to download the AArch64 software simulator from:

  TBD

Or:

  https://armkeil.blob.core.windows.net/developer/Files/downloads/ecosystem-models/FVP_Base_RevC-2xAEMvA_11.20_15_Linux64_armv8l.tgz

Building
========

  $ make arm_revc_ebbr_defconfig
  $ make

Running under FVP
=================

Finally, boot your system with:

 ${LOCATION_OF_FVP}/models/Linux64_armv8l_GCC-9.3/FVP_Base_RevC-2xAEMvA \
    --config-file board/arm/revc-ebbr/fvp.config \
    --parameter bp.secureflashloader.fname=output/images/bl1.bin \
    --parameter bp.flashloader0.fname=output/images/fip.bin \
    --parameter bp.virtioblockdevice.image_path=output/images/disk.img

TBD
    --network=nat

You can get network access from within the simulated environment
by requesting an IP address using DHCP (run the command 'udhcpc').

TBD
Links
arm_foundation
qemu_aarch64_ebbr

TODO
cleanup bootargs
make rng work in u-boot
make simple network work in u-boot
make u-boot pci work
fix linux osc splat
