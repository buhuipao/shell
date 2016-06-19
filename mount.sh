#!/bin/bash
# mount.sh
dd if=/dev/zero/ of=loopback.img bs=6M count=1 #创建img环回文件
mkfs.ext4 loopback.img

mkdir /mnt/loopback
mount -o loop loopback.img /mnt/loopback	#挂载
#或者手动：	losetup /dev/loop5 loopback.img 
#		mount /dev/loop5 /mnt/loopback
#

umount /mnt/loopback #	umount /dev/loop5

##挂载环回文件的某个分区，只能手动
#	losetup /dev/loop3 loopback.img 
#	fdisk /dev/loop3 #分区
# 	losetup -o 32256 /dev/loop4 loopback.img  假设/dev/loop4表示第一个分区 -O 指定偏移量，第一个分区起始于32256字节处

mkdir /mnt/iso
mount -o loop linux.iso /mnt/iso
#		对挂载设备作出操作后，当缓存区写满了再写到设备
#		可用sync立即写入设备

dd if=/dev/cdrom of=image1.iso


mkisofs -v "Lable" -o image1.iso  source_dir #		-o 指定ISO文件的路经，source_dir表示ISO文件内容来源


isohybrid usb_image.iso #	把一个镜像文件转为混合ISO，用于写入USB设备
dd if=usb_image.iso of=/dev/sdc1 #	写入设备

cdrecord -v dev=/dev/cdrom image.iso	#把镜像文件刻入光盘

eject #	弹出光驱
eject -t #合上光驱
