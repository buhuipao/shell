#!/bin/bash
# function.sh

# 函数的定义是唯一的，不要在函数定以前引用函数, 函数不得同名
function test {
  echo "This is an example of a function "
}

count=1
while [ $count -le 5 ]
do 
  test 
  count=$[$count + 1]
done 
echo "This is the end of loop"	
test
echo "Now this is the end of script "

function test1 {
  read -p "Enter a value :" value 
  echo "Doubling the value..."
  return $[$value*2]
 }

test1

#return返回的值不能大于256  
echo "The new value is $?" 

function func1 {
  echo $[$1+$2]
}
if [ $# -eq  2 ]
then 
#不可写成value=`func1`,出现无操作数的错误，传递参数给$1 $2
value=`func1 $1 $2`
echo The result is $value""
else 
	echo "Usage: $0 a b"
fi 

function func2 {
# 定义局部变量
  local temp=$[$value + 5] 
  result=$[$temp * 2]
}
temp=4 
value=6
func2
echo "The result is $result"
if [ $temp -gt $value ]
then
	 echo "temp is larger"
else 
	echo "temp is smaller"
fi

function func3 {
  local newarray
  newarray=(`echo "$@"`)
  echo "The new array is ${newarray[*]}"
}
function func4 {
	local newarray
	local sum=0
	value=(`echo "$@"`)
for value in ${value[*]}
do 
	sum=$[$sum+$value]
done 	
echo $sum
}
myarray=(1 2 3 4 5 )
echo "The original array is ${myarray[*]}"
func3{myarray[*]}
sumresult=`func4 ${myarray[*]}`
echo "The sumresult is $sumresult"

function now1 {
	local newarray
	local i
	local count 
	local oldarray
	count=$[$# -1]
	oldarray=(`echo "$@"`)
	newarray=(`echo "$@"`)
for (( i=0; i<=$count; i++))
do
	newarray[$i]=$[ ${oldarray[$i]} *2]
done
echo ${newarray[*]}

}
	array=(1 2 3 4 5)
	result=`func1 ${array[*]}`
echo "The result is ${result[*]}"
function now2 {
if [ $1 -eq 1 ]
then echo 1
else 
	local temp=$[$1- 1]
	local result=`func1 $temp`
	echo $[ $result * $1 ]
fi
}
read -p "Enter the number:" value
 	factorial=`now1 $value`
echo "The factorial is $factorial"
function addem {
	echo $[$1 + $2 ]
}
function addem2 {
	echo $[$1 *$2 ]
}
function addem3 {
if [ $2 -ne 0 ]
then 
	echo $[ $1/$2]
else 
	echo -1
fi
}

#应用函数库, . filepath
. ./myfuncs   

result=`addem 10 2`
echo "The result is $result"

