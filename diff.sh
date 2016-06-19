#!/bin/bash
# diff.sh
diff -u version1.txt version2.txt >version.patch	#生成差异文件
patch -p1 version1.txt < version.patch		#修补文件1为文件2
patch -p1 version1.txt < version.patch		#撤销修改

diff -Naur dir1 dir2 			#-N 将所有缺失的文件视为空文件，-a 将所有文件视为文本
					#-u 生成一体化输出 -r 遍历目录下的文件


