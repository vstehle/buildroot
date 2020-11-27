setenv bootargs root=/dev/mmcblk0p2 rootwait  console=ttyS1,115200

fatload mmc 0 $kernel_addr_r Image
fatload mmc 0 $fdt_addr_r bcm2837-rpi-3-b-plus.dtb

booti $kernel_addr_r - $fdt_addr_r
