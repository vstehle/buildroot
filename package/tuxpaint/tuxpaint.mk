################################################################################
#
# tuxpaint
#
################################################################################

TUXPAINT_VERSION = 0.9.22
TUXPAINT_SOURCE = tuxpaint-$(TUXPAINT_VERSION).tar.gz
TUXPAINT_SITE = http://downloads.sourceforge.net/project/tuxpaint/tuxpaint/$(TUXPAINT_VERSION)
TUXPAINT_DEPENDENCIES = libpaper pango sdl fribidi
# TODO! License

TUXPAINT_MAKE_OPTS = SVG_LIB= SVG_CFLAGS= SDL_PANGO_LIB=

define TUXPAINT_BUILD_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) $(TUXPAINT_MAKE_OPTS)
endef

define TUXPAINT_INSTALL_TARGET_CMDS
	$(TARGET_CONFIGURE_OPTS) $(MAKE1) -C $(@D) $(TUXPAINT_MAKE_OPTS) DESTDIR=$(TARGET_DIR) install
endef

$(eval $(generic-package))
