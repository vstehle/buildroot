Building
========

  $ make qemu_aarch64_ebbr_defconfig
  $ make

Generated file under output/images:

* u-boot.bin: The U-Boot image.

Running under Qemu
==================

Run the emulation with:

qemu-system-aarch64 \
    -accel hvf \
    -bios output/build/u-boot.bin \
    -cpu host \
    -device virtio-balloon-pci \
    -device virtio-rng-pci,rng=rng0 \
    -drive 'file=debian.qcow2,if=virtio,aio=threads,cache=writeback,discard=unmap' \
    -m 8000 \
    -machine virt \
    -net 'nic,model=virtio' \
    -net 'user,hostfwd=::10022-:22' \
    -nodefaults \
    -nographic \
    -object rng-random,filename=/dev/random,id=rng0 \
    -rtc 'base=utc,clock=host' \
    -serial 'mon:stdio' \
    -smp 8
