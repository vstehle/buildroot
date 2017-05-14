#!/bin/bash
set -eux

logs="$(pwd)/logs"
[ -d "$logs" ] || mkdir -v "$logs"

./output/host/usr/bin/qemu-system-aarch64 \
	-M virt \
	-append "console=ttyAMA0 debug initcall_debug ftrace=function_graph trace_buf_size=12M ftrace_graph_filter=gen_pci_probe,e1000_probe ftrace_graph_notrace=vprintk_func,__dev_printk,of_find_property,kmalloc_slab,dev_vprintk_emit,__udelay,__ioremap_caller" \
	-cpu cortex-a57 \
	-initrd output/images/rootfs.cpio \
	-kernel output/images/Image \
	-device e1000 \
	-nographic \
	-smp 1 \
	-trace events=qemu-trace.events,file="$logs/qemu-trace.log" \
	-virtfs local,security_model=none,mount_tag=tag0,path="$logs" \
	|& tee "$logs/qemu.log"
