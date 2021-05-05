qemu-system-aarch64 \
	-M virt,secure \
	-cpu cortex-a57 \
	-m 1024 \
	-nographic \
	-bios output/images/nor_flash.bin \
	-drive file=</path/to/disk.img>,if=none,format=raw,id=hd0 \
	-device virtio-blk-device,drive=hd0 \
	-netdev user,id=eth0 \
	-device virtio-net-device,netdev=eth0
