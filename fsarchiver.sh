#!/bin/bash
# fsarchiver.sh
fsarchiver savefs backup.fsa /dev/sda1 /dev/sda2
fsarchiver restfs backup.fsa id=0,dest=/dev/sda1 id=1,dest=/dev/sda2
#备份整个文件系统，恢复
