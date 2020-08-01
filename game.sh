#!/bin/bash -x
#constants
START_POSITION=0
position=$START_POSITION
#complete game till 100!!!
function playGame {
 	while [ $position -lt 100 ]
	do
		dieRoll=$((RANDOM%6 +1))
		option=$((RANDOM%3))
		case $option in
			0)position=$((position));;

			1)placeResult=$((position+dieRoll))
				if [ $placeResult -le 100 ]
				then
					position=$((position+dieRoll))
				else
					position=$position
				fi;;

			2)placeResult=$((position-dieRoll))
				if [ $placeResult -gt 0 ]
				then
					position=$((position-dieRoll))
				else
					position=$position
				fi;;
		esac
	done
}

playGame
