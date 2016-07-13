#!/bin/bash
# cpio.sh
# 用于fedora的RPM软件包，linux内核initramfs打包

echo file1 file2 file3 | cpio -ov archive.cpio 

cpio -it <archve.cpio		#列出归类文档中的内容

cpio -id <archve.cpio 		# 提取文件

###值得一提，cpio会解压出绝对路径，而tar解压出相对路径

