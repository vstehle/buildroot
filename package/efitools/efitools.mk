################################################################################
#
# efitools
#
################################################################################

EFITOOLS_VERSION = v1.9.2
EFITOOLS_SITE = git://git.kernel.org/pub/scm/linux/kernel/git/jejb/efitools.git
HOST_EFITOOLS_DEPENDENCIES = host-gnu-efi host-libopenssl

HOST_EFITOOLS_MAKE_OPTS = \
	DESTDIR=$(HOST_DIR) \
	CPPFLAGS="$(HOST_CPPFLAGS) -I$(HOST_DIR)/include/efi" \
	CFLAGS="$(HOST_CFLAGS)" \
	LDFLAGS="$(HOST_LDFLAGS)"

HOST_EFITOOLS_BINARIES = cert-to-efi-sig-list sig-list-to-certs sign-efi-sig-list \
	hash-to-efi-sig-list efi-readvar efi-updatevar cert-to-efi-hash-list \
	flash-var

define HOST_EFITOOLS_BUILD_CMDS
	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D) $(HOST_EFITOOLS_MAKE_OPTS) \
		$(HOST_EFITOOLS_BINARIES)
endef

define HOST_EFITOOLS_INSTALL_CMDS
	for b in $(HOST_EFITOOLS_BINARIES); do \
		$(INSTALL) -m 755 "$(@D)/$$b" "$(HOST_DIR)/bin/$$b"; \
	done
endef

$(eval $(host-generic-package))
