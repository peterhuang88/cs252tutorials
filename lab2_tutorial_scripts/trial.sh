#!/bin/bash

# ASSIGN A VARIABLE
# to reference a variable later, append "$" to the beginning when calling
VAR_A=0

# GET FIRST PARAM FROM COMMAND LINE
# so if I run "./trial.sh lol"
# VAR_B will have lol
VAR_B=$1
echo $VAR_B

# BONUS: get length of a string
LENGTH=${#VAR_B}
echo $LENGTH

# basic if else block
if [ $LENGTH -lt 6 ]; then
	echo "LESS THAN 6"
elif [ $LENGTH -gt 6 ]; then
	echo "GREATER THAN 0"
else
	echo "PETER WHY DO YOU SUCK AT CODING"
fi

# for loop example
for f in $( ls . )
do
	echo $f
done

# for loop for iterating a number of times (like in C/java etc)
# you shouldn't need this for this lab
for (( i=1; i<=5; i++ ))
do
	echo "For Hi: $i"
done

# standard while loop example
i=0
while [ $i -lt 5 ]
do
	echo "While Hi: $i"
	let i=i+1
done

# create and call an environment var
export PETER_MEME=hi
echo $PETER_MEME
