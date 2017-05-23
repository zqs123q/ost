#!/bin/bash
if [ -f "myos.iso" ]; then
	qemu-system-i386 -cdrom myos.iso;
elif [ -f "myos.bin" ]; then
	qemu-system-i386 -kernel myos.bin;
else
	echo "run make first";
fi
