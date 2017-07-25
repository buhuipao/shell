#!/bin/bash
# svn_backup.sh
SVNDIR=/data/svn
SVNADMIN=/user/bin/svnadmin
DATE=`date +%Y-%m-%d`
OLDDATE=`date +%Y-%m-%d -d '-30 days'`      # 30 days 
BACKDIR=/data/svnbackup

[ -d $BACKDIR ] ||  mkdir -p $BACKDIR 
LogFile=$BACKDIR/svnbak.log
[ -f $LogFile ] || touch $LogFile

mkdir $BACKDIR/$DATE

for PROJECT in myproject offical 
do
  cd $SVNDIR
  $SVNADMIN hotcopy $PROJECT $BACKDIR/$DATE/$PROJECT --clean-logs
  cd $BACKDIR/$DATE
  tar -zcvf $PROJECT-svn-$DATE.tar.gz $PROJECT >dev/null
  rm -rf $PROJECT
  sleep 3
done

HOST=192.168.11.99
FTP_USERNAME=svn
FTP_PASSPWORD=svn_pass

cd $BACKDIR/$DATE

ftp -i -n -v <<EOF        # Client FTP
open $HOST
user $FTP_USERNAME $FTP_PASSPWORD
bin
cd $OLDDATE
mdelete *
cd ..
rmdir $OLDDATE
mkdir $DATE
cd $DATE
mput *
bye
EOF
