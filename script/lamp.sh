#!/bin/bash
# lamp.sh
# Check root
if [ $UID -ne 0 ] 
then echo "Error: Please run with root !"
     exit -1 
fi

# Check Dist 
if grep -Eqi  "CentOS"  /etc/issue || grep -Eqi "CentOS" /etc/*-release
then
  DIST='CentOS';
  PM='yum';
elif grep -Eqi "Red Hat Enterprise Linux Server" /etc/issue  || grep -Eqi "Red Hat Enterprise Linux Server" /etc/*-release
then
  DIST='EHEL';
  PM='yum';
elif grep -Eqi "Aliyun" /etc/issue  || grep -Eqi "Aliyun" /etc/*-release
then
  DIST='Aliyun';
  PM='yum';
elif grep -Eqi "Fedora" /etc/issue  || grep -Eqi "Fedora" /etc/*-release
then
  DIST='Fedora';
  PM='yum';
elif grep -Eqi "Debian" /etc/issue  || grep -Eqi "Debian" /etc/*-release
then
  DIST='Debian';
  PM='apt-get';
elif grep -Eqi "Ubuntu" /etc/issue  || grep -Eqi "Ubuntu" /etc/*-release
then
  DIST='Ubuntu';
  PM='apt-get';
fi

# Install Mariadb/Mysql
 
 #Check Mysql_exit 
if  which mysql | grep -Eq -o "no"  
then
  $PM mysql 
else
  echo "You have install Mysql,skip install...";
fi

