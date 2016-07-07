#!/bin/bash
# awk.sh
# awk 'BEGIN {print "Satrt"} patren {commands} END {print "end"}' file
echo | awk '{var1="var1";var2="var2";var3="var3"; print var1"-"var2"-"var3;}'
		#awk的print 中”作为连接符，不是引用，以逗号分开时，分隔符是空格；并且变量不需要$符号，和C很相似
awk 'BEGIN{FS=":";OFS="-"} {print $1,$2,$3}' data1
                #awk 定义输入输出界定符
awk 'BEGIN{FS="\n";RS=""} {print $1 $4}' data2 
                #默认RS为一个换行符，FS为空格，来处理每一条数据流，但这里设置RS为空行，FS设置为换行符号
                #假设有一份员工信息，每个信息属性为一行，每个员工信息之间有一个空行，
                #可以提取每个员工第一个(姓名)和第四个(号码)信息输出
echo -e "line1 f2 f3\nline2 f2 f3\nline3 f2 f3" | awk '{print "line no:"NR" filed count:"NF" $0="$0" $1="$1" $2="$2" $3="$3" "}'
# NR指当前处理的文件行数和，而FNR指当前文件的行数，NF指当前行的字段数
awk 'END {print NR}' sed.sh	#统计行数

seq 5 | awk 'BEGIN {sum=0;print "Summation:"} { if( NR==5) print $1; else print $1"+"; sum+=$1} END {print "="sum}'
				#求和
var1="4"
var2="5"
echo | awk '{print v1,v2}' v1=$var1 v2=$var2

seq 5 |awk 'BEGIN {getline; print "Read ahead firt line ",$0} {print $0 }'	#getline 读取行

# awk 过滤模式	
# awk 'NR<5' 前五行	
# awk 'NR=1,NR=8' 一到八行	
# awk '/linux/' 可以使用正则表达式
# awk '!/linux/' 不包含linux的行

awk 'NR==3,NR==8' test.data  #打印3到8行
awk '/start_pettern/,/end_pattren/' filename 	#打印匹配的之间行	

awk -F: '{ print $NF }' /etc/passwd   #	-F 指定界定符
awk 'BEGIN{ FS=":"} {print $NF }' /etc/passwd  #打印最后一个字段

echo | awk '{ "grep root /etc/passwd" | getline cmd; print cmd}' 	#将shell外部输出读入变量


# for (i=0;i<10;i++) {print $i;}
# for (i in array ) {print array[i]}  	#使用for语句
