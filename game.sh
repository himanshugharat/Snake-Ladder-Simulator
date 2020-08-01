#!/bin/bash -x
#constants
START_POSITION=0
position=$START_POSITION
dieCount=0
#complete game till 100!!!
function playGame {
 	while [ $position -lt 100 ]
	do
		dieRoll=$((RANDOM%6 +1))
		option=$((RANDOM%3))
		((dieCount++))
		case $option in
			0)position=$((position))
				echo "the players position is $position";;

			1)placeResult=$((position+dieRoll))
				if [ $placeResult -le 100 ]
				then
					position=$((position+dieRoll))
					echo "the players position moved by $dieRoll is $position after the ladder"
				else
					position=$position
					echo "the players position is $position"
				fi;;

			2)placeResult=$((position-dieRoll))
				if [ $placeResult -gt 0 ]
				then
					position=$((position-dieRoll))
					echo "the players position moved by $dieRoll is $position after snake bite "
				else
					position=0
					echo "the players position is $position"
				fi;;
		esac
	done
echo "the total no of die rolls are $dieCount"
}

playGame
