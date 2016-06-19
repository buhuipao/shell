#!/bin/bash
# sed.sh
test=hello 
echo "hello world "|sed "s/$test/HELLO/g" 	# "进行引用变量
sed 's/Name/name/g' test.data
sed  -i .bak 's/Name/name/g'  test2.data	# -i选项用于替换源文件,先生成一个备份文件*.bak
sed '1,4s/Name/name/1g' test1.data 	# 和vim命令相似，1g表示从第1个匹配项开始改,如果后面接gc表示交互式替换
sed 's|88|99|g'	test.data 		# : / |都可以作为界定符

sed '/^$/d' test.data			#移除空行

echo "hdjsh 333 3333 kkk444 444 22 dfjskdjk ss333fff "| sed 's/\b[0-9]\{3\}\b/numeber/g' 	 
					# \{ ,\}转义字符，\b表示单词边界，防止将kkk444修改为kkknuber;

echo "this is linux not unix "| sed 's/\w\+/[&]/g'		#使用&代替匹配的单词；\w\+ 正则表达式表示所有单词的意思

echo "xiao YANG" | sed 's/\([a-z]\+\) \([A-Z]\+\)/\2 \1/g' 		#把大写单词和小写单词进行调换

echo abc | sed 's/a/A/g;s/b/B/g' 
echo abc |sed -e 's/a/A/g' -e 's/b/B/g'			#组合多组匹配  
#h,H,g,G 分表示：模式空间复制到保留空间，追加，保留空间复制到模式空间，追加，其中保留空间最初是一个空行
