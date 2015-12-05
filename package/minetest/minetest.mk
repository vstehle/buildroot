################################################################################
#
# minetest
#
################################################################################

MINETEST_VERSION = 0.4.13
MINETEST_SITE = $(call github,minetest,minetest,$(MINETEST_VERSION))

MINETEST_DEPENDENCIES = sqlite libcurl freetype leveldb xlib_libX11 libgl \
			mesa3d libjpeg bzip2 libpng irrlicht

MINETEST_CONF_OPTS = -DENABLE_SOUND=0
MINETEST_GAME_SOURCE = minetest_game-$(MINETEST_VERSION).tar.gz
MINETEST_EXTRA_DOWNLOADS = $(call github,minetest,minetest_game,$(MINETEST_VERSION))/$(MINETEST_GAME_SOURCE)

define MINETEST_GAME_EXTRACT
	$(call suitable-extractor,$(MINETEST_GAME_SOURCE)) $(DL_DIR)/$(MINETEST_GAME_SOURCE) | \
	$(TAR) -C $(@D) $(TAR_OPTIONS) -
	mv -v $(@D)/minetest_game-$(MINETEST_VERSION) $(@D)/games/minetest_game
endef
MINETEST_POST_EXTRACT_HOOKS += MINETEST_GAME_EXTRACT

$(eval $(cmake-package))
