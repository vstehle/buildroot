TODO!

wget https://people.eecs.berkeley.edu/~skarandikar/host/qemu/1.9/bblvmlinuxinitramfs_dynamic

#./output/host/usr/bin/qemu-system-riscv64 -nographic -kernel output/images/bbl
./output/host/usr/bin/qemu-system-riscv64 -nographic -kernel bblvmlinuxinitramfs_dynamic

./output/host/usr/bin/spike bblvmlinuxinitramfs_dynamic
