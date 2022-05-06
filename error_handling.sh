#!/usr/bin/env bash

if [[ $# == 1 ]]; then
  echo "Hello, $1"
else
  echo "Usage: error_handling.sh <person>"
  exit 1
fi

## True conditions:
# Will take only one argument
# more arguments separated by space but inside ""
# Empty argument -> " "

## False conditions:
# two or more arguments
# no argument

### IMORTANT: the code should exit with status 1
### else all the test cases won't run
