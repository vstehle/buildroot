Run the emulation with:

qemu-system-arm \
	-bios output/images/flash.bin \
	-cpu cortex-a15 \
	-d unimp \
	-drive 'file=output/images/disk.img,if=virtio,format=raw' \
	-m 2048 \
	-machine 'virt,secure=on' \
	-no-acpi \
	-nographic \
	-smp 2
