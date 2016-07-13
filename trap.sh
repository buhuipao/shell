#!/bin/bash
# trap.sh

trap "echo haha" SIGINT SIGTERM
trap  "echo byebye" EXIT
count=1
while [ $count  -lt 10 ]
do 
	echo "Loop #$count:"	
	sleep 1
	count=$[$count + 1]
done 
echo "This is the end of the process"
trap - EXIT 
echo "I just remove the trap "
