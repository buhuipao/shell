#!/bin/bash
# lvm.sh

#基本思路：fdisk LVM(8e) --> PV --> VG --> LV --> mkfs -> MOUNT --> 

#创建500M的LVM分区
fdisk /dev/sdb
n
p
1
default(2048)
+500M
p
t
8e
p
n
p
2
default
+800M
p
t
8e
p
w
partprobe

#启用LVM创建lv0,lv1逻辑卷
pvcreate /dev/sdb1 /dev/sdb2
vgcreate vg0 /dev/sdb1 /dev/sdb2
lvcreate -n lv0 -L 100 vg0  #创建lv0，PE大小为4M，则lv0大小为100*4M
lvcreate -n lv1 -L 200 vg0

#创建文件系统
mkfs.ext4 /dev/vg0/lv0
mkfs.ext4 /dev/vg0/lv1

#修改逻辑卷的大小
lvresize -L 300M lv0  #减小(lvreduce也可以)
#e2fsck -f /dev/vg0/lv0 #检查完整性
lvextend -L 900M lv1 #增大

#挂载
mkdir /lvm/
mount /dev/vg0/lv0 /lvm/

#使用快照功能
vgdisplay
echo "Hello world, buhuipao\!" > /lvm/
ls /lvm/ #可以看到一个文件和lost+found文件夹
lvcreate -n snap -L 300M -s /dev/vg0/lv0
lvs
umount /lvm/
lvconvert --merge /dev/vg0/snap #恢复后快照会自动删除
lvs
mount /dev# vg0/lv0 /lvm/
ls /lvm/  #100M的文件不见了，恢复成功

