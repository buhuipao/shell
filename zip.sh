#!/bin/bash
# zip.sh

gzip filename 
bzip2 filename
gunzip filename.gz		#解压所文件
bzip2 filename.bz2	

cat file | gzip -c >file.gz 

#####################################################
file_list ="file1 file2 file3 file4 file5"
for f in $file_list
do
tar -rvf archive.tar $f
done 

gzip archive.tar
tar -xavvf archve.tar.gz -C extract_directory
############################################

zcat text.gz 			#可以不解压文件读取内容
gzip -5 test.img 		#压缩文件，压缩率为5

#-------------------------------------------------------#
zip -r archive.zip file1 file2 		#压缩多个文件
zip file.zip -u newfile 		#更新文件内容
zip -d text.zip test.txt		#删除内容
unzip -l archive.zip 			#；列出文件
