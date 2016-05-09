################################################################################
#
# turbostat
#
################################################################################

LINUX_TOOLS += turbostat

TURBOSTAT_MAKE_OPTS = CROSS_COMPILE=$(TARGET_CROSS)

define TURBOSTAT_BUILD_CMDS
	$(Q)if test ! -f $(LINUX_DIR)/tools/power/x86/turbostat/Makefile ; then \
		echo "Your kernel version is too old and does not have the turbostat tool." ; \
		echo "At least kernel 2.6.38 must be used." ; \
		exit 1 ; \
	fi
	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
		$(TURBOSTAT_MAKE_OPTS) \
		turbostat
endef

define TURBOSTAT_INSTALL_TARGET_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(LINUX_DIR)/tools \
		$(TURBOSTAT_MAKE_OPTS) \
		DESTDIR=$(TARGET_DIR) \
		turbostat_install
endef
