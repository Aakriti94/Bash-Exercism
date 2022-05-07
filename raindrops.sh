#!/usr/bin/env bash

## The number would be input as $1
# echo $1

outputString=''

  if [[ $(($1 % 3)) == 0 ]]; then
    outputString+='Pling'
  fi

  if [[ $(($1 % 5)) == 0 ]]; then
    outputString+='Plang'
  fi

  if [[ $(($1 % 7)) == 0 ]]; then
    outputString+='Plong'
  fi

### MAN Page ###
# ${parameter:-word}
# Use Default Values.
# If parameter is unset or null, the expansion of word is substituted.
# Otherwise, the value of parameter is substituted.
# Here parameter-> outputString
# word -> $1


echo ${outputString:-$1}
