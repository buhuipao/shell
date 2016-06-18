#!/bin/bash
# sort_uniq_cat_tr_mktemp.sh

sort -nrk 3 file #倒序利用第三个的数字键值；
sort -nk 2,3 data.txt #规定键值位置，2,3之间
sort -m sorted1 sorted2 #合并两个已排序文件，
sort -C filename #验证文件是否排序过
sort -bd filename #忽略前导空白行，并指明以字典顺序进行排序
sort unsorted.txt | uniq 

---------------------------------------------------------------------------------------
uniq -u #只显示唯一的行
     -c #统计各行出现次数
     -d #找出重复的行
     -i 

---------------------------------------------------------------------------------------
mktemp -d text.XXX	生成临时文件夹
mktemp test.XXXX

---------------------------------------------------------------------------------------
split -b 10k file -d -a 4 newhead #以大小分割，规定前缀为newhead，-d(数字) -a 后缀为4位数字
csplit server.log /SERVER/ -z -n 2 -s {*} -f server -b "%02d.log"  #以SERVER为关键字分割，-z 删除空文件，
								   #-n 规定后缀数字个数2，-s 静默三模式，
								   #-f 规定前缀，-b 规定后缀格式 %02d.log

---------------------------------------------------------------------------------------
cat -s /var/www/html/install.php	# -s 选项可以滤除多余的空行；
cat -T file.py			# -T 选项可以将表制符标记为^I，便于缩进产生错误；
cat -n file.py 			#-n选项产生行号,-b将跳过空白行，标注行号；

---------------------------------------------------------------------------------------
echo "HELLO WHO IS HERE " | tr 'A-Z' 'a-z' 	
echo "tr comwe,tr qiusha, tr chenhua" | tr 'a-zA-Z' 'n-za-mN-ZA-M'	#ROT13加密算法
tr '\t' ' ' < file.py
echo "Hello 123 world 434 !" | tr -d '0-9' 	#-d删除,与-d相反，
echo "Hello 123 world 434 !" | tr -d -c '0-9 \n' 	#-d -c将不在集合内的字符删除
echo "The GUN is          not UNIX.Do you   known    it?" | tr -s ' '	# 压缩多余的空格
