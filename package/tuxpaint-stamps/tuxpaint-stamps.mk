################################################################################
#
# tuxpaint-stamps
#
################################################################################

TUXPAINT_STAMPS_VERSION = 2014.08.23
TUXPAINT_STAMPS_SOURCE = tuxpaint-stamps-$(TUXPAINT_STAMPS_VERSION).tar.gz
TUXPAINT_STAMPS_SITE = http://downloads.sourceforge.net/project/tuxpaint/tuxpaint-stamps/$(subst .,-,$(TUXPAINT_STAMPS_VERSION))
# TODO! License

define TUXPAINT_STAMPS_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) PREFIX=$(TARGET_DIR)/usr/local install-all
endef

$(eval $(generic-package))
