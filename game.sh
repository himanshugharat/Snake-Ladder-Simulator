#!/bin/bash -x

#constants
START_POSITION=0
positionOfPlayer1=$START_POSITION
dieCountOfPlayer1=0
dieCountofPlayer2=0
positionOfPlayer2=$START_POSITION

# the die roll
function dieRolled {
	if [ $1 -eq 2 ]
	then
		dieRoll=$((RANDOM%6 +1))
		((dieCountOfPlayer2++))
	else
		diceRoll=$((RANDOM%6 +1))
		((dieCountOfPlayer1++))
	fi
}

#the choice for ladder same position or snake bite
function playOptions {
	option=$((RANDOM%3))
	case $option in
		0)if [ $1 -eq 1 ]
		then
			positionOfPlayer1=$((positionOfPlayer1))
			echo "the players$1 position is $positionOfPlayer1"
		else
			positionOfPlayer2=$((positionOfPlayer2))
			echo "the players$1 position is $positionOfPlayer2"
		fi;;
		1)	if [ $1 -eq 1 ]
			then
				placeResult=$((positionOfPlayer1+dieRoll))
				if [ $placeResult -le 100 ]
				then
					positionOfPlayer1=$((positionOfPlayer1+dieRoll))
					echo "the players$1 position moved by $dieRoll is $positionOfPlayer1 after the ladder"
					dieRolled $1
					playOptions $1
				else
					positionOfPlayer1=$positionOfPlayer1
					echo "the players position$1 is $positionOfPlayer1"
				fi
			else
				placeResult=$((positionOfPlayer2+dieRoll))
				if [ $placeResult -le 100 ]
				then
					positionOfPlayer2=$((positionOfPlayer2+dieRoll))
					echo "the players$2 position moved by $dieRoll is $positionOfPlayer2 after the ladder"
				else
					positionOfPlayer2=$positionOfPlayer2
					echo "the players$2 position is $positionOfPlayer2"
				fi
			fi;;

		2)	if [ $1 -eq 1 ]
			then
				placeResult=$((positionOfPlayer1-dieRoll))
				if [ $placeResult -gt 0 ]
				then
					positionOfPlayer1=$((positionOfPlayer1-dieRoll))
					echo "the players$1 position moved by $dieRoll is $positionOfPlayer1 after snake bite "
				else
					positionOfPlayer1=0
					echo "the players$1 position is $positionOfPlayer1"
				fi
			else
				placeResult=$((positionOfPlayer2-dieRoll))
				if [ $placeResult -gt 0 ]
				then
					positionOfPlayer2=$((positionOfPlayer2-dieRoll))
					echo "the players$1 position moved by $dieRoll is $positionOfPlayer2 after snake bite "
				else
					positionOfPlayer2=0
					echo "the players$1 position is $positionOfPlayer2"
				fi
			fi;;
	esac
}

#the running function for exact 100 th place
function playGame {
 	while [ $positionOfPlayer1 -lt 100 ] && [ $positionOfPlayer2 -lt 100 ]
	do
		dieRolled 1
		playOptions 1
		dieRolled 2
		playOptions 2
	done
}


#main code
playGame

#condition to check the winner
if [ $positionOfPlayer1 -gt $positionOfPlayer2 ]
then
	echo "player1 wins the game and has rolled dice for $dieCountOfPlayer1"
else
	echo "player2 wins the game and has eolled dice for $dieCountOfPlayer2"
fi
