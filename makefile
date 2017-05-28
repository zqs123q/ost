myos.iso: myos.bin
	mkdir -p isodir/boot/grub
	cp myos.bin isodir/boot/
	cp grub.cfg isodir/boot/grub/
	grub-mkrescue -o myos.iso isodir

# 可以直接使用myos.bin加载到qemu,省略前面的生成iso步骤
myos.bin: boot.o kernel.o linker.ld
	i686-elf-gcc -T linker.ld -o myos.bin -ffreestanding -O2 -nostdlib boot.o kernel.o -lgcc
	@# 确认bin文件格式
	@if grub-file --is-x86-multiboot myos.bin; then \
	echo multiboot confirmed;\
	else \
	echo the file is not multiboot;\
	fi

kernel.o: kernel.c
	@# 配置好交叉编译环境后,记得把相应的命令加入到环境变量
	@# -MD 输出依赖信息
	i686-elf-gcc -MD -c kernel.c -o kernel.o -std=gnu99 -ffreestanding -O2 -Wall -Wextra

boot.o: boot.s
	i686-elf-as boot.s -o boot.o

clean:
	rm -rf *.o myos.* isodir *.d
