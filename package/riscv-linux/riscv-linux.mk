################################################################################
#
# RISC-V Linux
#
################################################################################

RISCV_LINUX_VERSION = 1ef29a9683e39def0c19fa0e77efa9d11f51d489
RISCV_LINUX_SITE = $(call github,riscv,riscv-linux,$(RISCV_LINUX_VERSION))
RISCV_LINUX_LICENSE = GPLv2

$(eval $(generic-package))
