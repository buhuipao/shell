#!/bin/bash
# rename.sh
	
var="www.buhuipao.com"
name=${var%.*}
name1=${var%%.*}	#贪婪模式
name3=${var#*.}
name4=${var##*.}	#贪婪模式
echo File name is $name
echo File name1 is $name1
echo File name2 is $name3
echo File name3 is $name4

count=1
for pic in `find /home/buhuipao/SHELL2/2/ -maxdepth 1 -type f \( -name "*.jpg" -o -name "*.png" \) `
do 
	var1=image-$count.${pic##*.}	
	echo "Rename $pic to $var1"
	mv "$pic" "$var1"
	let count++
done

