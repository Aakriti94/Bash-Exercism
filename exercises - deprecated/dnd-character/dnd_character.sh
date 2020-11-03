#!/usr/bin/env bash

#declaring a array named 'array'
declare -a array

#declaring a array named 'character_array'
declare -a character_array=(0 1 2 3 4 5)

sum=0
counter=0
cm=0
hitpoints=0


function roll_a_dice_fourtimes() {
  for (( j = 1; j < 5; j++ )); do
    array[j]=$((1 + RANDOM%6))
    #echo "dice"$[j]": "${array[j]}
    #echo ${array[j]}
  done
}

function smallest_no() {
  if [ ${array[1]} -lt ${array[2]} ] && [ ${array[1]} -lt ${array[3]} ] && [ ${array[1]} -lt ${array[4]} ]; then
    smallest=${array[1]}
  else
    if [ ${array[2]} -lt ${array[3]} ] && [ ${array[2]} -lt ${array[4]} ]; then
      smallest=${array[2]}
    else
      if [ ${array[3]} -lt ${array[4]} ]; then
        smallest=${array[3]}
      else
        smallest=${array[4]}
      fi
    fi
  fi
  #echo "smallest: "$smallest
}

function sum_of_largest_three_no() {
  for (( k = 1; k < 5; k++ )); do
    if [[ ${array[k]} -ne $smallest ]]; then
      sum=$((sum + array[k]))
      (( counter++ ))
    fi
  done

  if [[ $counter -eq 2 ]]; then
    sum=$((sum + $smallest))
  elif [[ $counter -eq 1 ]]; then
    sum=$((sum + $smallest + $smallest))
  elif [[ $counter -eq 0 ]]; then
    sum=$(($smallest + $smallest + $smallest))
  fi
  #echo "counter: "$counter
  #echo "sum: "$sum
  character_array[i]=$sum
  #echo ${character_array[i]}
  sum=0
  counter=0
  smallest=0
}

function constitution_modifier_and_hitpoints() {
  step_one=$((character_array[2]-10))
  div=$((step_one/2))
  mod=$((step_one%2))

  if [ $mod -ne 0 ] && [ $step_one -lt 0 ]; then
    div=$((div - 1))
    #echo $((div - 1))
  #else
    #echo $div
  fi

  hitpoints=$((10 + div))
  #echo $hitpoints
}

function generate_a_character() {
  constitution_modifier_and_hitpoints
  echo ""
  echo "strength:" ${character_array[0]}
  echo "dexterity:" ${character_array[1]}
  echo "constitution:" ${character_array[2]}
  echo "intelligence:" ${character_array[3]}
  echo "wisdom:" ${character_array[4]}
  echo "charisma:" ${character_array[5]}
  echo "hitpoints:" $hitpoints
  echo ""
}

#calling functions to create characteristics of a character
for (( i = 0; i < ${#character_array[@]}; i++ )); do
  roll_a_dice_fourtimes
  smallest_no
  sum_of_largest_three_no
done

if [[ "$1" == "generate" ]]; then
  generate_a_character
elif [[ "$1" == "modifier" ]]; then
  character_array[2]=$2
  constitution_modifier_and_hitpoints
  echo $div
fi
