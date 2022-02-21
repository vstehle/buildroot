################################################################################
#
# a3700-utils-marvell
#
################################################################################

A3700_UTILS_MARVELL_VERSION = e733e9f139ff23c1b0346c6e89f5530a4c24db3b
A3700_UTILS_MARVELL_SITE = $(call github,MarvellEmbeddedProcessors,a3700-utils-marvell,$(A3700_UTILS_MARVELL_VERSION))

define HOST_A3700_UTILS_MARVELL_BUILD_CMDS
	$(MAKE) -C $(@D)/wtptp/src/Wtpdownloader_Linux -f makefile.mk CXX="$(HOSTCXX)"
endef

define HOST_A3700_UTILS_MARVELL_INSTALL_CMDS
	$(INSTALL) -m 0755 -D \
		$(@D)/wtptp/src/Wtpdownloader_Linux/WtpDownload_linux \
		$(HOST_DIR)/bin/WtpDownload_linux
endef

$(eval $(generic-package))
$(eval $(host-generic-package))
