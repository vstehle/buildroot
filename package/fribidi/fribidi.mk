################################################################################
#
# fribidi
#
################################################################################

FRIBIDI_VERSION = 0.19.7
FRIBIDI_SOURCE = fribidi-$(FRIBIDI_VERSION).tar.bz2
FRIBIDI_SITE = http://fribidi.org/download
FRIBIDI_INSTALL_STAGING = YES
#TODO! License

$(eval $(autotools-package))
