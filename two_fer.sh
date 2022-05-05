#!/usr/bin/env bash

if [[ $# == 1 ]]; then
  echo "One for ${1}, one for me."
elif [[ $# -gt 1 ]]; then
  echo "One for ${1}, one for me."
else
  echo "One for you, one for me."
fi

## pseudoCode

# if name is given: One for name, one for me.
# if name is not given: One for you, one for me.
# if two names are given: choose the first argument only: One for name, one for me.

# $# == 1 One for name, one for me.
# $# == 0 One for you, one for me.
# $# >1   One for you, one for me.
