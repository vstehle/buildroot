################################################################################
#
# bbl
#
################################################################################

BBL_VERSION = 7a7106885367201ffbfd6f5568d8c5262dbb766d
BBL_SOURCE = bbl-$(BBL_VERSION).tar.gz
BBL_SITE = $(call github,riscv,riscv-pk,$(BBL_VERSION))

BBL_DEPENDENCIES = linux

BBL_INSTALL_TARGET = NO
BBL_INSTALL_IMAGES = YES

BBL_CONF_OPTS = --with-payload=$(LINUX_DIR)/vmlinux
BBL_SUBDIR = build

define BBL_BUILD_DIR_HOOK
	[ -d $(@D)/$(BBL_SUBDIR) ] || mkdir -p $(@D)/$(BBL_SUBDIR)
	cd $(@D)/$(BBL_SUBDIR) && ln -svf ../configure .
endef

BBL_PRE_CONFIGURE_HOOKS += BBL_BUILD_DIR_HOOK

define BBL_INSTALL_IMAGES_CMDS
	$(INSTALL) -m 0644 $(@D)/$(BBL_SUBDIR)/bbl $(BINARIES_DIR)
endef

$(eval $(autotools-package))
