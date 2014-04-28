################################################################################
#
# dos2unix
#
################################################################################

DOS2UNIX_VERSION = 6.0.5
DOS2UNIX_SITE = http://waterlan.home.xs4all.nl/dos2unix
DOS2UNIX_DEPENDENCIES =

define DOS2UNIX_BUILD_CMDS
	$(MAKE) -C $(@D) CC="$(TARGET_CC)" CFLAGS_USER="$(TARGET_CFLAGS)" \
		LDFLAGS_USER="$(TARGET_LDFLAGS)"
endef

define HOST_DOS2UNIX_BUILD_CMDS
	$(MAKE) -C $(@D) CFLAGS_USER="$(HOST_CFLAGS)" \
		LDFLAGS_USER="$(HOST_LDFLAGS)"
endef

# TODO! Do not install doc
define DOS2UNIX_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) INSTALL="$(INSTALL)" prefix="$(TARGET_DIR)/usr" install
endef

define HOST_DOS2UNIX_INSTALL_CMDS
	$(MAKE) -C $(@D) INSTALL="$(INSTALL)" prefix="$(HOST_DIR)/usr" install
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
