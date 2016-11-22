################################################################################
#
# RISC-V ISA simulator
#
################################################################################

RISCV_ISA_SIM_VERSION = 679d5f5e927a0a59bbaaab33955ded79e860cded
RISCV_ISA_SIM_SITE = $(call github,riscv,riscv-isa-sim,$(RISCV_ISA_SIM_VERSION))
RISCV_ISA_SIM_DEPENDENCIES = riscv-fesvr

$(eval $(host-autotools-package))
