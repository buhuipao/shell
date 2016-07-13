#!/bin/bash
# control.sh

#Ctrl+Z暂停进程,Ctrl+C停止
trap "echo  Hi!" INT        #可以监控系统信号,命令格式为trap "commands " SIGNALS
trap -p                     #打印当前trap设置
trap -l                     #打印所有信号


./rename.sh &               #&可以后台运行命令
jobs                        #可以显示后台暂停或运行的程序

bg  [作业号]                #可以以后台或前台运行进程，后台运行的进程将无法用Ctrl+C停止
fg  [作业号] 

nice -n command             #n 取值为-20(最高)～20 ，表示改变命令的优先级，但是注意的是！（普通用户不具有改变优先级的权限）！
renice  n  -p PID: 与nice相似，但是：只能对拥有的进程进行调度，只能调到更低，根用户可以使用它将任何进程调至任何优先级

nohup command               #将运行命令使之,但要exit退出，可以防止在关闭终端时退出进程

at -f control.sh 17:30      #指定时间运行脚本,还可指定时间增量，如：Now +25minutes ;10:15PM tomorrow ;10:15 +7days
atq                         #可以列出排队的作业，
atrm -n                     #删除作业，n为编号；

batch -f test.sh            #用于系统负载低于0.8时运行，不需要指定时间

min hour day month dayofweek command 
15 10 * * * command         #希望每天都执行命令；
15 */10 * * 1 command       #希望每个月的每一周星期一每10个小时执行
00 12 1 * * command         #希望每个月第一天中午执行
00 12 * * * if[ 'date +%d -d tomorrow '= 01]; then ;command  #表示每个月的最后一天中午执行

