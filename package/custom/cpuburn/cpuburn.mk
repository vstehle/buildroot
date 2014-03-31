################################################################################
#
# cpuburn
#
################################################################################

CPUBURN_VERSION = 1.4a
CPUBURN_SOURCE = cpuburn_$(CPUBURN_VERSION).orig.tar.gz
CPUBURN_SITE = http://http.debian.net/debian/pool/main/c/cpuburn
CPUBURN_SUBDIR = ARM

define CPUBURN_BUILD_CMDS
	$(MAKE) CC="$(TARGET_CC) $(TARGET_CFLAGS)" -C $(@D)/$(CPUBURN_SUBDIR)
endef

define CPUBURN_INSTALL_TARGET_CMDS
	$(INSTALL) -D -m 0755 $(@D)/$(CPUBURN_SUBDIR)/burnCortexA[89] $(TARGET_DIR)/usr/bin
endef

$(eval $(generic-package))
