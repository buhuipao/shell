#!/bin/bash
#svn publish.sh

SVN=/usr/local/bin/svn

cd /var/www/html/svn_log/files/svn/
svn up --username web --password webpass

cd /var/www/html/svn_log/files/svntest/file.log | svn log $2 |head -n 5 |sed -n "/publish/p">svnlog
svnlog_change = `sed -i "s/publish please/already published/g" svnlog`
cat /var/www/html/svn_log/files/svntest/file.log |awk -F ',' '{print "/usr/local/bin/svn propest --username web --password webpass -r"$1" --revprop svn: log "$svnlog_change" " $2i }' | /bin/sh

[-d /var/www/html/svn_log/files/svntest] || mv /var/www/svn_log/files/svntest /var/www/html
/old-svntest/html - $COMMIT
mkdir /var/www/html/svn_log/files/svntest
chmod -R 777 /var/www/html/svn_log/files/svntest
chown -R www:www /var/www/html/svn_log/files/svntest
cd /var/www/html/svn_log/files/svn
svn up --username web --password webpass
