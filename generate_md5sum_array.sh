#!/bin/bash
# generate_checksum.sh
pidarry=()	#定义空数组
for file in data.txt data1.txt
do 
 md5sum $file &		#后台运行
pidarry+=("$!")		#添加数组元素,last pid
done 
echo ${pidarry[@]}
wait ${pidarry[@]}	#等待进程结束才结束脚本
