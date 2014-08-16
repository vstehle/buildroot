################################################################################
#
# npe-firmware
#
################################################################################

NPE_FIRMWARE_VERSION = 2_4
NPE_FIRMWARE_SITE = http://downloadmirror.intel.com/12954/eng
NPE_FIRMWARE_SOURCE = IPL_ixp400NpeLibrary-$(NPE_FIRMWARE_VERSION).zip
NPE_FIRMWARE_LICENSE = PROPRIETARY
NPE_FIRMWARE_REDISTRIBUTE = NO

define NPE_FIRMWARE_EXTRACT_CMDS
	unzip -d $(@D) $(DL_DIR)/$(NPE_FIRMWARE_SOURCE)
	mv -v $(@D)/ixp400_xscale_sw/src/npeDl/* $(@D)
	rm -fr $(@D)/ixp400_xscale_sw
endef

define NPE_FIRMWARE_BUILD_CMDS
	cp -f package/npe-firmware/IxNpeMicrocode.h $(@D)
	cd $(@D) && $(HOSTCC) IxNpeMicrocode.c -o IxNpeMicrocode && ./IxNpeMicrocode -be
endef

define NPE_FIRMWARE_INSTALL_TARGET_CMDS
	$(INSTALL) -d -m 0755 $(TARGET_DIR)/lib/firmware/
	cp -avf $(@D)/NPE-* $(TARGET_DIR)/lib/firmware/
endef

$(eval $(generic-package))
