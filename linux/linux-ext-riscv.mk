################################################################################
# Linux RISC-V extensions
#
# Patch the linux kernel with RISC-V extension
################################################################################

LINUX_EXTENSIONS += riscv

define RISCV_PREPARE_KERNEL
#	cp -dpfr $(EV3DEV_LINUX_DRIVERS_DIR)/* $(LINUX_DIR)/drivers/lego/
endef
