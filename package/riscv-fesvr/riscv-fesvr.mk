################################################################################
#
# RISC-V Frontend Server
#
################################################################################

RISCV_FESVR_VERSION = 7c56507ba1a4a9a2f83773590f3fd9f122871c05
RISCV_FESVR_SITE = $(call github,riscv,riscv-fesvr,$(RISCV_FESVR_VERSION))

$(eval $(host-autotools-package))
