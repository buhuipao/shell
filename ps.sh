#!/bin/bash
# ps.sh

ps -eo comm,pcpu | head 
ps -eo comm,pid | head
#---------------------------------------#
# pcpu      | CPU占用率                 #
# pid       | 进程ID                    #
# ppid      | 父进程ID                  #
# pmem      | 内存使用率                #
# comm      | 可执行文件                #
# cmd       | 简单命令                  #
# user      | 进程用户                  #
# nice      | 优先级                    #
# stat      | 进程状态                  #
# tty       | 所关联的TTY设备           #
# time      | 累计CPU时间               #
# etime     | 进程启动后流逝时间        #
# euid      | 有效用户ID                #
ps -eo comm,pcpu --sort -pcpu |head         #依据cpu的使用率进行排序

ps -eo comm,pid,pcpu,pmem | grep bash       #搜索bash的资源占用情况

ps -C bash -o pid=                          #加上一个等于，可以直接输出PID,bin

pgrep bash  

ps -u root -U root -o user,pcpu     
