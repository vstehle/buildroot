################################################################################
#
# mesa-demos
#
################################################################################

MESA_DEMOS_VERSION = halex
MESA_DEMOS_SITE = http://sw-stash.freescale.net/scm/mss/mesa-demos.git
MESA_DEMOS_SITE_METHOD = git
MESA_DEMOS_AUTORECONF = YES

# TODO: Hardcode less options.
MESA_DEMOS_CONF_OPT = \
	--disable-freetype2 \
	--disable-gbm \
	--disable-gles2 \
	--disable-libdrm \
	--disable-osmesa \
	--disable-vg \
	--disable-wayland \
	--enable-egl \
	--enable-gles1 \
	--enable-x11

$(eval $(autotools-package))
