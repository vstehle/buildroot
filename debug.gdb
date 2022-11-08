target remote :1234

symbol-file output/build/optee-os-custom/out/core/tee.elf

break stmm_enter_user_mode

cont
