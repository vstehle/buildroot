################################################################################
#
# apex
#
################################################################################

APEX_VERSION = 1.6.8
APEX_SITE = git://gitorious.org/apex/apex.git
APEX_BOARD_NAME = $(call qstrip,$(BR2_TARGET_APEX_BOARDNAME))
APEX_LICENSE = GPLv2
APEX_LICENSE_FILES = COPYING
APEX_INSTALL_IMAGES = YES

APEX_ARCH=$(KERNEL_ARCH)

APEX_MAKE_OPTS += \
	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
	ARCH=$(APEX_ARCH)

define APEX_CONFIGURE_CMDS
	$(MAKE) -C $(@D) $(APEX_MAKE_OPTS) $(APEX_BOARD_NAME)_config
endef

define APEX_BUILD_CMDS
	$(MAKE) -C $(@D) $(APEX_MAKE_OPTS)
endef

define APEX_INSTALL_IMAGES_CMDS
	$(INSTALL) -D -m 0755 $(@D)/apex.bin $(BINARIES_DIR)/
endef

$(eval $(generic-package))

ifeq ($(BR2_TARGET_APEX),y)
# we NEED a board name unless we're at make source
ifeq ($(filter source,$(MAKECMDGOALS)),)
ifeq ($(APEX_BOARD_NAME),)
$(error NO Apex board name set. Check your BR2_TARGET_APEX_BOARDNAME setting)
endif
endif
endif
