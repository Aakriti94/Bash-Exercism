#!/usr/bin/env bash

for (( i = 1; i < $#; i++ )); do
  j=$(( i + 1 ))
  echo "For want of a" "${!i}" " the" "${!j}" "was lost."
done
if [[ $# > 0 ]]; then
  echo "And all for the want of a" "$1""."
else
  echo ""
fi

# ${!i} prints the value of $i. So, $i=1 and ${!i}=nail
# '$#' length_of_array
