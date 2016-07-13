#!/bin/bash
# crontab.sh

#   crontab -e 
#   00 10 * * * /home/buhuipao/script.sh      00 5,6,7 * * * /script    第5，6，7小时执行脚本
#   
crontab task.cron
crontab<< EOF
http_proxy=http://192.168.0.3:3182 
00 * * * * /home/buhuipao/download.sh
EOF

crontab -l -u buhuipao #列出所有内容
crontab -u buhuipao -r #删除任务表，都需要root权限

