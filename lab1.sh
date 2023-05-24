[10:48 AM] Amr ElBoredie, Vodafone



#!/bin/bash

### demos calculator, for a floating point math operations

### parameters: 1st operand , operation, 2nd operation

## output: based on the operation, the script calulcate the operation nd prints the result

## Exit codes:

#		0: Normal termination

#		1: Insufficient parameters

#		2: 1st operand is not an integer

#		3: 2nd operand is not an integer

#		4: Invalid operation

#		5: Incase of division, the 2nd operand is 0 (Division by zero)

if [ ${#} -ne 3 ]

then

	echo "Insufficient parameters"

	exit 1

fi

OP1=${1}

OP2=${3}

OP=${2}

### Check if 1st operand is an float or no

CHK=$(echo "${OP1}" | grep "^[0-9]*[.][0-9]*$")


#if [  ${CHK} -eq 1 ]

if [[ $CHK == 1 ]]

then

	echo "1st operand is not a float"

	exit 2

fi


CHK=$(echo "${OP2}" | grep "^[0-9]*[.][0-9]*$")

#if [  ${CHK} -eq 1 ]

if [[ $CHK == 1 ]]

then

	        echo "2nd operand is not a float"

		exit 3

fi

case "${OP}" in

	"add")

RES=$(echo "$OP1 + $OP2" | bc)

		;;

	"sub")

RES=$(echo "$OP1 - $OP2" | bc)


		;;

	"mul")

RES=$(echo "$OP1 * $OP2" | bc)


		;;

	"div")

		if [ ${OP2} -eq 0 ]

		then

			echo "Error: Division by zero"

			exit 5

		fi

RES=$(echo "$OP1 / $OP2" | bc)


		;;

	*)

		echo "Invalid operation"

		exit 4

		;;

esac

echo "Result = ${RES}"

echo "Bye bye"

exit 0




