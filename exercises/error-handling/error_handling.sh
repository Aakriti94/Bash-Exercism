#!/usr/bin/env bash

if [[ $# -eq 1 ]]; then
  echo "Hello, $1"
else
  echo "Usage: ./error_handling <greetee>"
fi
