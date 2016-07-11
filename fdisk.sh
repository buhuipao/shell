#!/bin/bash
# fdsik.sh

fdisk /dev/sdb #操作某一分区
-m #帮助指令
-n #创建新的分区,
-p(主分区)|| -e(逻辑分区) # 起始扇区从2048开始，之前的0为MBR和主分区表，1-2047为grub保留
                          #0扇区的结构：MBR --> 446bytes
                          #             主分区表 --> 4*16bytes
                          #             结束标志 --> 55AAH
+2G (大小)
-w(保存) || -q(不保存)

# 创建xfs
fsmk.xfs /dev/sdb1  #格式化为xfs

mkdir -P /mnt/part1 && mount -t xfs /dev/sdb1 /mnt/part1  #挂载

# 创建为swap
mkswap /dev/sdb1
swapon /dev/sbd1
echo '/dev/sdb1 swap swap default 0 0' >> /etc/fstab    #启动时挂载

#fdisk上限为2T，可以使用parted代替
#xfs_quota 可以限制用户文件容量和文件数量 一般参数为xfs_quota -x -c ' cmd ' 挂载点

