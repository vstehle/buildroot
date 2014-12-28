################################################################################
#
# or1ksim
#
################################################################################

OR1KSIM_VERSION = f75787f390cbd543b8ae49a2670ff338d6e9326a
OR1KSIM_SITE = $(call github,openrisc,or1ksim,$(OR1KSIM_VERSION))
HOST_OR1KSIM_CONF_OPTS = --program-transform-name='s/^/or1k/'

# Ship the config file, too.
define HOST_OR1KSIM_INSTALL_CFG
	$(INSTALL) -D -m 0644 $(@D)/sim.cfg $(HOST_DIR)/usr/share/openrisc/or1ksim.cfg
endef
HOST_OR1KSIM_POST_INSTALL_HOOKS += HOST_OR1KSIM_INSTALL_CFG

$(eval $(host-autotools-package))
