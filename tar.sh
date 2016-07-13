#!/bin/bash
# tar.sh

tar -cf output.tar file1 file2 file3  ##-c表示创建文件

tar -cf output.tar path  --exclude "*.txt" 	#排除文件

tar -tf output.tar 		#-t 列出文件

tar -rvf output.tar file4		# 追加文件4

tar -xvf output.tar file1 file2 -C . 	#从tar文件提取出file1 file2，其他忽略

tar -Af file1.tar file2.tar 		#拼接两个文件

tar -uvvf output.tar filea 		#如果filea比tar里面的文件新，就会被添加进去，出现同名文件 
                              # 提取时只会提取最新的文件
tar -f output.tar --delete file1 file2 	#删除tar中文件

tar --delete -file output.tar file1 file2 	#删除文件

#-a选项 可以根据文件名自动压缩文件
tar -acvf output.tar.gz file1 file2 file3 
tar -czvvf archve.tar.gz file1 file2 file3 
tar -cavvf archve.tar.gz file2 file2 file3  #压缩为gzip
tar -cjvvf archve.tar.bz2 file1 file2 file3
tar -cavvf archve.tar.bz2 file1 file2 file3 #压缩为bzip2
tar -cvvf  -lzma archive.tar.lzma file1 file2 file3
tar -xavvf archieve.tar.lzma -C extract_directory

