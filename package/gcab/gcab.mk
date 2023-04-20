################################################################################
#
# gcab
#
################################################################################

GCAB_VERSION = 1.5
GCAB_SOURCE = gcab-$(GCAB_VERSION).tar.xz
GCAB_SITE = https://download.gnome.org/sources/gcab/$(GCAB_VERSION)

HOST_GCAB_DEPENDENCIES = host-libglib2
HOST_GCAB_CONF_OPTS = -Ddocs=false -Dintrospection=false

$(eval $(host-meson-package))
