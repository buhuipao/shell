#!/bin/bash
# cut.sh
cut test.data -f 2,4		#显示2，4
cut -f 3 -d ";" test1.data  #自定义分割符

cut -c1-5 test2.data #切割1-5个字符
cut -c -5 test2.data #切割第一个到第五个字符
cut -c 5- test2.data #切割第5个到最后一个字符
cut -c1-3,8-10  test2.data --output-delimiter ";" 	#切割两段字符，并且用;隔开
