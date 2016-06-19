#!/bin/bash
# grep.sh
echo -e "this is a word\nnext line" | grep word

grep "text" file* -lZ | xargs -0 rm 		##-l -Z 一起使用，用0值作分割符

echo -e "this is a\n is  little\n of text" | grep -e "this" -e "line"  

grep -E "[a-z]+" filename
#或者
egrep "[a-z]+" filename		#使用正则表达式

grep -o word filename 	#只输出匹配的文本部分

grep -v match_txt file 	#将匹配结果进行反转

grep -c "text" filename			#统计行数

echo -e "1 2 3 4\nhello\n5 6" | grep -c "[0-9]"		##统计行数

echo -e "1 2 3 4\nhello\n5 6" | grep -e  "[0-9]"| wc -1		#统计匹配项数量

cat /var/www/html/install.php | grep drupal -i --color=auto -n 		#打印匹配的行号,忽略大小写

echo gun is not unix | grep -b -o "not" 		#打印所位于的字符字节便宜便移

grep -l drupal /var/www/html/install.php /etc/passwd	#匹配文本处于哪个文件中

grep "text" . -R -n 	#第归搜索 -R/-r

grep "main()" . -r --include *.{c,cpp}		#找出所有.c和.cpp文件，

						# exclude "*" 排除

#-------------------------------------------------------------------------#
seq 10 | grep 5 -A 3		#打印后三行
seq 10 | grep 5 -B 3		#打印前三行
seq 10 | grep 5 -C 3		#打印匹配的前后3行，加入有多个匹配，结果将会用--分开
