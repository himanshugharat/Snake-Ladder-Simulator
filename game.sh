#!/bin/bash -x
#constants
START_POSITION=0
position=$START_POSITION
dieRoll=$((RANDOM%6 +1))
option=$((RANDOM%3))
case $option in
	0)position=$((position));;
	1)position=$((position+dieRoll));;
	2)result=$((position-dieRoll))
		if [ $result -gt 0 ]
		then
			position=$((position-dieRoll))
		else
			position=$position
		fi;;
esac
