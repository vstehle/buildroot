################################################################################
#
# irrlicht
#
################################################################################

IRRLICHT_VERSION = 1.8.3
IRRLICHT_SITE = http://downloads.sourceforge.net/irrlicht
IRRLICHT_SOURCE = irrlicht-$(IRRLICHT_VERSION).zip
IRRLICHT_INSTALL_STAGING = YES
IRRLICHT_DEPENDENCIES = libgl xlib_libX11 xlib_libXext xproto_xf86vidmodeproto

define IRRLICHT_EXTRACT_CMDS
	$(UNZIP) -d $(BUILD_DIR) $(DL_DIR)/$(IRRLICHT_SOURCE)
endef

define IRRLICHT_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) \
	$(MAKE) -C $(@D)/source/Irrlicht
endef

define IRRLICHT_INSTALL_STAGING_CMDS
	$(INSTALL) -D -m 0644 $(@D)/lib/Linux/libIrrlicht.a $(STAGING_DIR)/usr/lib/libIrrlicht.a
	cp -v $(@D)/include/* $(STAGING_DIR)/usr/include/
endef

$(eval $(generic-package))
