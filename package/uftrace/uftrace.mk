################################################################################
#
# uftrace
#
################################################################################

UFTRACE_VERSION = v0.7
UFTRACE_SITE = $(call github,namhyung,uftrace,$(UFTRACE_VERSION))
UFTRACE_DEPENDENCIES = elfutils
UFTRACE_LICENSE = GPL-2.0
UFTRACE_LICENSE_FILES = COPYING

define UFTRACE_CONFIGURE_CMDS
	cd $(@D) && \
	$(TARGET_MAKE_ENV) CC="$(TARGET_CC)" CFLAGS="$(TARGET_CFLAGS)" \
	LD="$(TARGET_LD)" ARCH="$(ARCH)" \
	./configure --prefix=/usr
endef

define UFTRACE_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D)
endef

define UFTRACE_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install DESTDIR="$(TARGET_DIR)"
endef

$(eval $(generic-package))
