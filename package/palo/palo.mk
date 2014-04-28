################################################################################
#
# palo
#
################################################################################

PALO_VERSION = v1.95
PALO_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/deller/palo.git
PALO_DEPENDENCIES = host-fakeroot
PALO_LICENSE = GPLv2
PALO_LICENSE_FILES = COPYING

# By default palo wants to create a text README during build, from the HTML
# supplied one. To do so, palo's Makefile calls the lynx web browser.
# To avoid depending on a host lynx package, we fool palo's Makefile by
# creating an empty README file before the build.
define HOST_PALO_BUILD_CMDS
	touch $(@D)/README
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) CC="cc $(HOST_CFLAGS)"
endef

define HOST_PALO_INSTALL_CMDS
	$(HOST_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR="$(HOST_DIR)" \
					INSTALL="fakeroot $(INSTALL)"
endef

$(eval $(host-generic-package))
