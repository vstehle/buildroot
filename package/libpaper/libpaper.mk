################################################################################
#
# libpaper
#
################################################################################

LIBPAPER_VERSION = 1.1.24+nmu5
LIBPAPER_SOURCE = libpaper_$(LIBPAPER_VERSION).tar.gz
LIBPAPER_SITE = http://http.debian.net/debian/pool/main/libp/libpaper
LIBPAPER_AUTORECONF = YES
LIBPAPER_INSTALL_STAGING = YES
#TODO! License

$(eval $(autotools-package))
