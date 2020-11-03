#!/usr/bin/env bash

declare -a array_of_inputs

array_of_inputs=$@
length_of_array=$#

#echo $array_of_inputs
#echo $length_of_array

for (( i = 1; i < (length_of_array); i++ )); do
  #echo $i
  #echo "${!i}"
  echo -n "For want of a" "${!i}"
  (( i++ ))
  echo " the" "${!i}" "was lost."
  (( i-- ))
done
if [[ $length_of_array > 0 ]]; then
  echo "And all for the want of a" "$1""."
else
  echo ""
fi
