**************************************
Freescale i.MX31 PDK development board
**************************************

This file documents the Buildroot support for the Freescale i.MX31 PDK in "3
stack" configuration.

Build
=====

First, configure Buildroot for your SABRESD board:

  make freescale_imx31_3stack_defconfig

Build all components:

  make

You will find in ./output/images/ the following files:
  - rootfs.tar
  - zImage

Boot the PDK board
==================

To boot your newly created system, you need to setup a TFTP server, as well as
a NFS server, as explained in Freescale i.MX31 PDK 1.5 Linux User's Guide,
available on Freescale website, in IMX31_PDK15_LINUXDOCS_BUNDLE.zip archive,
pdk15_imx31__Linux_UG.pdf.

Here is a sample RedBoot configuration, for proper network boot of the PDK:

    RedBoot> fconfig -l
    Run script at boot: true
    Boot script: 
    .. load -r -b 0x100000 zImage
    .. exec -c "console=ttymxc0,115200 rw root=/dev/nfs ip=dhcp nfsroot=<your NFS server IP address>:<your NFS root path>,v3,tcp"
    
    Boot script timeout (1000ms resolution): 2
    Use BOOTP for network configuration: false
    Gateway IP address: <your gateway IP address>
    Local IP address: <your PDK IP address>
    Local IP address mask: 255.255.255.0
    Default server IP address: <your TFTP"server IP address>
    Board specifics: 0
    Console baud rate: 115200
    Set eth0 network hardware address [MAC]: false
    GDB connection port: 9000
    Force console for special debug messages: false
    Network debug at boot time: false

Adapt to your network configuration.

To run on board, connect a serial terminal set to 115200n8. `buildroot` will
present a login prompt on the serial port.

Enjoy!
