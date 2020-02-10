#!/bin/bash

if [ 1 -gt 2 ]
	then echo 1
else echo 4
fi

echo "*****************************"
b="1234567890"
echo $b
echo ${b:1:3}
echo "b的长度是${#b}"
echo "*****************************"

echo "***************数组**************"
arr=(1 2 3 4 5)
echo "数组的长度是${#arr[@]}"
echo "数组的第二个元素是${arr[1]}"
echo "*****************************"

for i in ${arr[@]};
do
	echo $i;
done
echo "*****************************"

for i in ${arr[*]};
do
	echo $i;
done


c=`expr 1 + 2`
echo $c