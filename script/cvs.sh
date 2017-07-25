#!/bin/bash
# CVS backup for fedora23
#2016/3/30

CVSDIR=/home/cvsroot/project
DATE=`date +%Y-%m-%d`
OLDDATE=`date +%y-%m-%d -d -10days`      # -10 days 

BACKDIR=~/data/backup/cvs-bakup
FILENAME=cvsbackup_"$DATE"

if [ ! -d ${BACKDIR}/${DATE} ];then
  mkdir ${BACKDIR}/${DATE}
fi

if [ -d ${BACKDIR}/${OLDDATE} ];then
  rm -rf ${BACKDIR}/${OLDDATE}
fi

HOST=192.163.7.220
FTP_USENAME=cvs_user
FTP_PASSWORD=cvs_pass

cd $CVSDIR
tar czvf $FILENAME.tar.gz $CVSDIR

ftp -i -n -v << EOF
open $HOST
user $FILENAME $FTP_PASSWORD
bin
rmdir $OLDDATE
mkdir $DATE
cd $DATE
mput *
bye
EOF
