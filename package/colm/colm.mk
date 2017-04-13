################################################################################
#
# colm
#
################################################################################

COLM_VERSION = 0.13.0.4
COLM_SITE = git://git.colm.net/colm.git
COLM_AUTORECONF = YES

# Needed for autoreconf to work properly
define COLM_FIXUP_M4_DIR
	mkdir $(@D)/m4
endef
HOST_COLM_POST_EXTRACT_HOOKS += COLM_FIXUP_M4_DIR

$(eval $(host-autotools-package))
