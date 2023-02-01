Building
========

  $ make qemu_aarch64_ebbr_defconfig
  $ make

Running under Qemu
==================

Run the emulation with:

  qemu-system-aarch64 \
      -M virt,secure=on \
      -bios output/images/flash.bin \
      -cpu cortex-a53 \
      -device virtio-blk-device,drive=hd0 \
      -device virtio-net-device,netdev=eth0 \
      -device virtio-rng-device,rng=rng0 \
      -drive file=output/images/disk.img,if=none,format=raw,id=hd0 \
      -m 1024 \
      -netdev user,id=eth0 \
      -no-acpi \
      -nographic \
      -object rng-random,filename=/dev/urandom,id=rng0 \
      -rtc base=utc,clock=host \
      -smp 2 \
      -s -S # qemu_aarch64_ebbr_defconfig
