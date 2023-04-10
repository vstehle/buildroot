setenv bootargs console=ttyS2,115200n8 console=tty1 earlycon debug
usb start
load usb 0:2 ${kernel_addr_r} boot/Image
load usb 0:2 ${fdt_addr_r} boot/rk3399-gru-kevin.dtb
booti ${kernel_addr_r} - ${fdt_addr_r}
