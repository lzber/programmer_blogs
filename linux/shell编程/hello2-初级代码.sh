#!/bin/bash
a=1
b=1
if [ $a -eq $b ]
then echo "a==b"
else echo "a!=b"
fi

echo "124"

if [ $a -eq $b -o $a -lt $b ]
then echo "1"
else echo "2"
fi

if [ !false ] 
then echo "b"
fi

c=""
if [ ${#c}==0 ]
then echo "length is 0"
fi

 