#!/usr/bin/env bash

## accepting the user input through $1
## checking if the input is empty or not
if [[ -z "$1" ]]
then
  ## if $1 is empty
  echo "One for you, one for me."
else
  ## if $1 is not empty
  echo "One for "$1", one for me."
fi
