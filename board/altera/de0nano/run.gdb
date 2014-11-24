# Load and run the Linux system generated with buildroot on the de0 nano.
# You need to launch OpenOCD gdb server first.
target remote localhost:3333
load
jump *0x100
