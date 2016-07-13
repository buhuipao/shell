#!/bin/bash
# which_kill.sh
whereis isohybrid
which php
#----------------------------#
kill -9 PROCESS_ID           #杀死进程
# -2 终止进程，与Ctrl+C
# -20 暂停进程,Ctrl+Z，-15 默认终止进程

killall -u USERNAME process_name        #killall可以直接接受进程名，kill接受ID


