#!/bin/bash
# sed_awk.sh

factory=1
counter=1
number=$1
while [ $counter -le $number ]
do
	factory=$[$factory * $counter]
	counter=$[$counter + 1]
done
result=`echo $factory | sed '{
:start
s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/	
t start
}'`
echo "The result is $result"

sed s/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/ data1 #用来给数字串三位加点号，括号全部加反斜杆用以分组替换:\1,\2

sed 'G' data2         #给文本数据添加空行，保留空间有一个空行，追加到模式空间，但最后一行也会出现一个空行
echo "最后一行不想加空行"
sed '$!G' data2       #用最后一行不加空行

sed 's/<[^<]*>//g; /^$/d;' test.html    #用来解析网页，去掉标签
awk  '/^\(?[2-9][0-9]{2}\)?(| |-|.)([0-9]{3})(-| |.)([0-9]{4})$/{print $0}'    #用来解析美国电话号码
awk '/^([a-zA-Z0-9_\.\+\-]+)@([a-z0-9_\-\+\.]+)\.([a-z]{2,5})$/{print $0}'     #用来解析邮件地址

#先找到数据中原有的空行并删除，然后在每行后面加入空行
sed '{
/^$/d
$!G
}' data4

sed -n '{
1!G
h
$p
}' data2

sed '=' data2 | sed 'N; s/\n/ /'
#对错误消息进行编号
#N将下一行添加到模式空间，而n是将处理标移动到下一行
sed '{
:start
$q
N
11,$D
b start
}' /etc/passwd
sed '/./,/^$/!d' data8  |  sed '{ :start;/^\n*$/{$d; N; b start}}'
### 从有字符到有一个空行前不删除，其余全部删除，也就是保留每一行数据后的一个空行
#	sed '/./,$/!d' data8 
#	从有数据到结尾不删除，之前的都删，用来取出开头的空行

#找到一个空行，匹配判断再执行大括号的，假如是最后一行就删除，不是就向下加一行，再回到开始判断，
#1):如果加入的是一行数据，则重新判断一行数据，
#2):如果加入的是一个空行，则是含有多个空行,再次进入大括号判断...再加一行，1):
sed '{ :start;/^\n*$/{$d; N; b start}}'

