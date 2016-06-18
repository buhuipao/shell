#!/bin/bash
# find.sh
find /home/ -maxdepth 4 -mindepth 2 \( -name "*.py" -o -name "*.log" \) -print 
	# 在2层和4层目录下寻找.py或者.log文件，如果是-path就是寻找路径，例如*/html/*
  #  -o mean or ,-a mean and 
find /home/ -type d -atime -7 -newer script.sh -print 
# 类型为目录（还有其他参数f,l,c,b...), -atime(-m(content changed ),-c(chown/chmod))访问时间小于7天的(+7,7)目录，
	# -amin表示访问时间以分钟计, -newer 比script.sh 文件新，常用于写系统备份和维护脚本；
find . -type f -size -2k -name "*.swp" -delete 
	# 大小小于2k(还有b[块即512字节],c,M,G),并删除，
find /var/www/html/ -type f -name "*.php" ! -perm 644  -user apache -print 
	# 找出 权限不为644的,且属于apache用户的php文件；
#----------------------------------------------------------------------------------------#
#----------------------------------------------------------------------------------------#
find . -type f -name "*.sh" -exec cat {} \;>all_shell_file.txt 
	# -exec 配合{} 可以用来执行命令，如果要执行多个命令，可以用-exec ./shell.sh {} \;
