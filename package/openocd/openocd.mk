################################################################################
#
# openocd
#
################################################################################

OPENOCD_VERSION = 0.8.0
OPENOCD_SOURCE = openocd-$(OPENOCD_VERSION).tar.bz2
OPENOCD_SITE = http://downloads.sourceforge.net/project/openocd/openocd/$(OPENOCD_VERSION)

OPENOCD_AUTORECONF = YES
OPENOCD_CONF_OPTS = \
	--oldincludedir=$(STAGING_DIR)/usr/include \
	--includedir=$(STAGING_DIR)/usr/include \
	--disable-doxygen-html \
	--with-jim-shared=no \
	--disable-shared \
	--enable-dummy

OPENOCD_DEPENDENCIES = 

ifeq ($(BR2_PACKAGE_LIBFTDI),y)
OPENOCD_DEPENDENCIES += libftdi
endif

ifeq ($(BR2_PACKAGE_LIBUSB),y)
OPENOCD_DEPENDENCIES += libusb
endif

ifeq ($(BR2_PACKAGE_LIBUSB_COMPAT),y)
OPENOCD_DEPENDENCIES += libusb-compat
endif

ifeq ($(BR2_PACKAGE_LIBHID),y)
OPENOCD_DEPENDENCIES += libhid
endif

# Adapters

ifeq ($(BR2_PACKAGE_OPENOCD_FTDI),y)
OPENOCD_CONF_OPTS += --enable-ftdi
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_STLINK),y)
OPENOCD_CONF_OPTS += --enable-stlink
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_TI_ICDI),y)
OPENOCD_CONF_OPTS += --enable-ti-icdi
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_ULINK),y)
OPENOCD_CONF_OPTS += --enable-ulink
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_UBLASTER2),y)
OPENOCD_CONF_OPTS += --enable-usb-blaster-2
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_JLINK),y)
OPENOCD_CONF_OPTS += --enable-jlink
endif

ifeq ($(BR2_PACKAGE_OPENOCD_OSDBM),y)
OPENOCD_CONF_OPTS += --enable-osbdm
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_OPENDOUS),y)
OPENOCD_CONF_OPTS += --enable-opendous
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_AICE),y)
OPENOCD_CONF_OPTS += --enable-aice
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_VSLLINK),y)
OPENOCD_CONF_OPTS += --enable-vsllink
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_USBPROG),y)
OPENOCD_CONF_OPTS += --enable-usbprog
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_RLINK),y)
OPENOCD_CONF_OPTS += --enable-rlink
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_ARMEW),y)
OPENOCD_CONF_OPTS += --enable-armjtagew
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_CMSIS_DAP),y)
OPENOCD_CONF_OPTS += --enable-cmsis-dap
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_PARPORT),y)
OPENOCD_CONF_OPTS += --enable-parport
endif

ifeq ($(BR2_PACKAGE_OPENOCD_FT2XXX),y)
OPENOCD_CONF_OPTS += --enable-legacy-ft2232_libftdi
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_VPI),y)
OPENOCD_CONF_OPTS += --enable-jtag_vpi
endif
	  
ifeq ($(BR2_PACKAGE_OPENOCD_UBLASTER),y)
OPENOCD_CONF_OPTS += --enable-usb_blaster_libftdi
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_AMTJT),y)
OPENOCD_CONF_OPTS += --enable-amtjtagaccel
endif
	  
ifeq ($(BR2_PACKAGE_OPENOCD_ZY1000_MASTER),y)
OPENOCD_CONF_OPTS += --enable-zy1000-master
endif
	  
ifeq ($(BR2_PACKAGE_OPENOCD_ZY1000),y)
OPENOCD_CONF_OPTS += --enable-zy1000
endif
	  
ifeq ($(BR2_PACKAGE_OPENOCD_EP93XX),y)
OPENOCD_CONF_OPTS += --enable-ep93xx
endif
	  
ifeq ($(BR2_PACKAGE_OPENOCD_AT91RM),y)
OPENOCD_CONF_OPTS += --enable-at91rm9200
endif
	  
ifeq ($(BR2_PACKAGE_OPENOCD_BCM2835),y)
OPENOCD_CONF_OPTS += --enable-bcm2835gpio
endif

ifeq ($(BR2_PACKAGE_OPENOCD_GW16012),y)
OPENOCD_CONF_OPTS += --enable-gw16012
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_PRESTO),y)
OPENOCD_CONF_OPTS += --enable-presto_libftdi
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_OPENJTAG),y)
OPENOCD_CONF_OPTS += --enable-openjtag_ftdi
endif
      
ifeq ($(BR2_PACKAGE_OPENOCD_BUSPIRATE),y)
OPENOCD_CONF_OPTS += --enable-buspirate
endif
	  
ifeq ($(BR2_PACKAGE_OPENOCD_SYSFS),y)
OPENOCD_CONF_OPTS += --enable-sysfsgpio
endif

# enable all configuration options for host build to avoid duplicating 
# the very long selection logic made for target
# we suppose that host compilation time and disk space is not a problem
# (suggestion by Thomas Petazzoni)
# Note that deprecated options have been removed
# CMSIS_DAP needs hidapi (actually not included in buildroot)
# and zy1000 stuff fails to build, so they've been removed too
# if anybody needs them, let me know
HOST_OPENOCD_CONF_OPTS = \
    --enable-ftdi \
    --enable-stlink \
    --enable-ti-icdi \
    --enable-ulink \
    --enable-usb-blaster-2 \
    --enable-jlink \
    --enable-osbdm \
    --enable-opendous \
    --enable-aice \
    --enable-vsllink \
    --enable-usbprog \
    --enable-rlink \
    --enable-armjtagew \
    --enable-parport \
    --enable-jtag_vpi \
    --enable-usb_blaster_libftdi \
    --enable-amtjtagaccel \
    --enable-gw16012 \
    --enable-presto_libftdi \
    --enable-openjtag_ftdi \
    --enable-buspirate \
    --enable-sysfsgpio \
	--oldincludedir=$(HOST_DIR)/usr/include \
	--includedir=$(HOST_DIR)/usr/include \
	--disable-doxygen-html \
	--with-jim-shared=no \
	--disable-shared \
	--enable-dummy

HOST_OPENOCD_DEPENDENCIES = host-libftdi host-libusb host-libusb-compat

$(eval $(autotools-package))
$(eval $(host-autotools-package))
