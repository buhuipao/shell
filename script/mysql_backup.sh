#!/bin/bash
#mysql_backup

USERNAME=buhuipao
PASSWORD=ch19950802qs

DATE=`date +%Y-%m-%d`
OLDDATE=`date +%Y-%m-%d -d -20days`
FTPOLDDATE=`date +%Y-%m-%d -d -60days` 

MYSQl=`which mysql`
MYSQLDUMP=`which mysqldump`
SOCKET=/tmp/mysql.sock
DBNAME=buhuipao
BACKDIR=/home/buhuipao/data/

[-d $BACKDIR] || mkdir -p $BACKDIR
[-d $BACKDIR/$DATE] || mkdir -p $BACKDIR/$DATE
[-d $BACKDIR/$OLDDATE] || mkdir -p $BACKDIR/$OLDDATE

$MYSQLDUMP --opt -u $USERNAME -p$PASSWORD -s $SOCKET $DBNAME  | gzip>$BACKDIR/$DATE/mysql-$DATE.sql.gz

echo "$DBNAME has been backup successful!"
sleep 5

HOST=139.129.38.208
FTP_USERNAME=mysqlbk
FTP_PASSWORD=mysqlbk_password

cd $BACKDIR/$DATE

ftp -i -n -v << EOF
open $HOST
user $FTP_USERNAME $FTP_PASSWORD
bin 
cd $FTPOLDDATE
mdelete *
cd ..
rmdir $FTPOLDDATE
mkdir $DATE
cd $DATE 
mput *
bye 
EOF
