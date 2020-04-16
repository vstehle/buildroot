################################################################################
#
# custom
#
################################################################################

CUSTOM_VERSION = 0.1
CUSTOM_SITE = package/custom/files
CUSTOM_SITE_METHOD = local

CUSTOM_ENV = \
	CC="$(TARGET_CC)" \
	INSTALL="$(INSTALL)"

define CUSTOM_BUILD_CMDS
	$(CUSTOM_ENV) $(MAKE) -C $(@D)
endef

define CUSTOM_INSTALL_TARGET_CMDS
	$(CUSTOM_ENV) $(MAKE) -C $(@D) install PREFIX="$(TARGET_DIR)/usr"
endef

$(eval $(generic-package))
