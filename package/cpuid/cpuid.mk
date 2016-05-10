################################################################################
#
# cpuid
#
################################################################################

CPUID_VERSION = 20151017
CPUID_SOURCE = cpuid-$(CPUID_VERSION).src.tar.gz
CPUID_SITE = http://www.etallen.com/cpuid
CPUID_LICENSE = GPLv2+
CPUID_LICENSE_FILES = LICENSE

define CPUID_BUILD_CMDS
	$(MAKE) -C $(@D) CC="$(TARGET_CC)" LD="$(TARGET_LD)"
endef

define CPUID_INSTALL_TARGET_CMDS
	$(MAKE) -C $(@D) BUILDROOT="$(TARGET_DIR)" install
endef

$(eval $(generic-package))

