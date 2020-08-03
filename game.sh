#!/bin/bash -x

#constants
START_POSITION=0
positionOfPlayer1=$START_POSITION
WIN_PLACE=100

#vaiables
dieCountOfPlayer1=0
dieCountofPlayer2=0
positionOfPlayer2=$START_POSITION
position=0

#the choice for ladder same position or snake bite
function playOptions {
dieRoll=$1
option=$2
position=$3
case $option in
	0)
		position=$((position));;
	1)
		placeResult=$((position+dieRoll))
		if [ $placeResult -le $WIN_PLACE ]
		then
			position=$((position+dieRoll))
			position="$(playOptions $(( RANDOM % 6 + 1 )) $(( RANDOM % 3 )) $position)"
		else
			position=$position
		fi;;
	2)	placeResult=$((position-dieRoll))
		if [ $placeResult -gt $START_POSITION ]
		then
			position=$((position-dieRoll))
		else
			position=0
		fi;;
esac
echo $position
}

#the running function for exact 100 th place
function playGame {
while :
do
	if [ $positionOfPlayer1 -eq $WIN_PLACE ] || [ $positionOfPlayer2 -eq $WIN_PLACE ]
	then
		break
	fi
	((dieCountOfPlayer1++))
	positionOfPlayer1="$(playOptions $((RANDOM % 6+1)) $((RANDOM %3 )) $positionOfPlayer1)"
	echo "position of player 1 is $positionOfPlayer1"
	echo "positin of player 2 is $positionOfPlayer2"
	((dieCountOfPlayer2++))
	positionOfPlayer2="$(playOptions $((RANDOM % 6+1)) $((RANDOM %3 )) $positionOfPlayer2)"
done
}


#main code
playGame

if [ $positionOfPlayer1 -eq $WIN_PLACE ]
then
	echo "player 1 won"
	echo "Dice rolled were $dieCountOfPlayer1"
else
	echo "player 2 won"
	echo "Dice rolled were $dieCountOfPlayer2"
fi
