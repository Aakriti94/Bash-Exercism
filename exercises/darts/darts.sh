#!/usr/bin/env bash

x="$1"
y="$2"
distance=0
square=0
re='^[+-]?[0-9]+([.][0-9]+)?$'

function calculations() {
  #square=$(( (x*x) + (y*y) ))
  #https://www.unix.com/unix-for-dummies-questions-and-answers/152680-sqrt-bash.html
  #square=$(ruby -e "puts '%.2f' % Math.sqrt($a * $b)")
  a=$(echo "$x * $x" | bc -l)
  b=$(echo "$y * $y" | bc -l)
  square=$(echo "$a + $b" | bc -l)
  distance=$(awk -v x=$square 'BEGIN{print sqrt(x)}')
  #echo $square
  #echo $distance
}

function output() {
  if (( $(echo "$distance >= 0" | bc -l) )) && (( $(echo "$distance <= 1" | bc -l) )); then
    #echo "Inner circle"
    echo "10"
  elif (( $(echo "$distance >= 1" | bc -l) )) && (( $(echo "$distance <= 5" | bc -l) )); then
    #echo "Middle circle"
    echo "5"
  elif (( $(echo "$distance >= 5" | bc -l) )) && (( $(echo "$distance <= 10" | bc -l) )); then
    #echo "Outer circle"
    echo "1"
  else
    #echo "Missed target"
    echo "0"
  fi

}

#https://stackoverflow.com/questions/806906/how-do-i-test-if-a-variable-is-a-number-in-bash
if ! [[ $x =~ $re ]] ; then
   echo "error: Invalid arguments";
else
  if ! [[ $y =~ $re ]] ; then
    echo "error: Invalid arguments";
  else
    calculations
    output
  fi
fi
