#!/usr/bin/env bash
#This script checks a year for a leap year or not

input=0
re='^[0-9]+$'
echo "Please enter an year"
read input

if [[ $input =~ $re ]]; then
  if [[  $(($input % 400)) -eq 0 ]]; then
    echo "The given year is a leap year."
  elif [[ $(($input % 100)) -eq 0 ]]; then
    echo "The given year is not a leap year."
  elif [[ $(($input % 4)) -eq 0 ]]; then
    echo "The given year is a leap year."
  else
    echo "The given year is not a leap year."
  fi
else
  echo "The input is not a number. Please input a number."
fi
