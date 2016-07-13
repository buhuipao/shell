#!/bin/bash
#rsync.sh

rsync -avz /home/buhuipao/php buhuipao@45.62.116.72:/home/buhuipao/data	#-a表示进行归类，-v显示进度细节,-z压缩数据
rsync -avz /home/buhuipao/code/ /mnt/disk/backup/code/ --exclude "*.txt" #排除txt文件，或者使用--exclude-from flielist
rsync -avz source_path directory_path --delete 		#默认不删除远端文件，加上--delete可以删除
crontab -ev 0 */10 * * * rsync -avz /home/code/ user@IP:/home/backup/   #每10小时备份一次到远端
