#!/bin/bash

if [ ! -f test.txt ]; then
  echo "default" > test.txt
fi

if [ $# -eq 0 ]; then
  cat test.txt
elif [ $# -eq 1 ]; then
  echo $1 > test.txt
else
  exit 1
fi
