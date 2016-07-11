#!/bin/bash
# RAID.sh

#RIAD0: 数据依次写入硬盘，性能提升,n > 2
#RAID1: 镜像盘，可靠性提高，n > 2
#RAID5: 采取奇偶校验，可恢复损坏数据,RAID0和RAID1的中间方案, n > 3
#RAID10: 继承RAID0和RAID1的特性，n > 4

#创建RAID5的磁盘阵列(-l 5)，至少为3块磁盘(-n 3)，1块作冗余(-x 1)
mdadm -Cv /dev/md0 -a yes -n 3 -x 1 -l 5 /dev/sdb /dev/sdc /dev/sdd /dev/sde
mkfs.ext4 /dev/md0

#挂载
mkdir /raid && mount /dev/md0 /raid
lsblk 
echo "/dev/md0 /raid ext4 defaults 0 0" >> /etc/fstab #重启也生效

#查看详细信息, 三块激活状态，一块的状态为sqare，-Q查看缩略信息
mdadm  -D /dev/md0

#模拟磁盘损坏情况
mdadm /dev/md0 -f /dev/sdc
mdadm -D /dev/md0
#这个时侯可以看到/dev/sde直接顶替坏掉的磁盘，达到冗余效果

#创建RAID10的阵列
mdadm -Cv /dev/md0 -a yes -n 4  -l 10 /dev/sdb /dev/sdc /dev/sdd /dev/sde
