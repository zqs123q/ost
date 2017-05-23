# 一个最简单的内核(kernel)
所有代码来自于[osdev](http://wiki.osdev.org/Bare_Bones)
在这里记录一些小坑
## 环境
- 系统:Ubuntu 16.04
- 最新版本[gcc](https://gcc.gnu.org/)(为交叉编译环境准备),当前最新7.1.0版本的[日本镜像](http://ftp.tsukuba.wide.ad.jp/software/gcc/releases/gcc-7.1.0/)(国内下载速度较快),[编译](https://itbilu.com/linux/management/V1vdnt9ll.html)耗时较长,我的i5低压u大概用了两三个小时
- [交叉编译环境](http://wiki.osdev.org/GCC_Cross-Compiler)(cross-complier,这个最重要,也是最麻烦)
- [qemu](http://www.qemu.org/)(虚拟机,写好的kernel运行在它上面),使用apt安装就好`sudo apt-get install qemu`
- grub,乌班图自带,生成bin和iso文件
- xorriso,`sudo apt-get install xorriso`,`配合grub生成iso文件,没有的话运行`grub-mkrescue`无反应
- grub-pc-bin,`sudo apt-get install grub-pc-bin`,配合grub食用,否则生成的iso文件qemu无法识别(Could not read from CD-ROM (code 0009))
