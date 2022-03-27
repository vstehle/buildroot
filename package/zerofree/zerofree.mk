################################################################################
#
# zerofree
#
################################################################################

ZEROFREE_VERSION = 1.1.1
ZEROFREE_SOURCE = zerofree-$(ZEROFREE_VERSION).tgz
ZEROFREE_SITE = https://frippery.org/uml
ZEROFREE_LICENSE = GPL-2.0
ZEROFREE_LICENSE_FILE = COPYING
ZEROFREE_DEPENDENCIES = e2fsprogs

define ZEROFREE_BUILD_CMDS
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) all
endef

define ZEROFREE_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/zerofree $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
