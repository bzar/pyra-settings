#!/bin/bash

if [ ! -f autologin.txt ]; then
  echo "true" > test.txt
fi

if [ $# -eq 0 ]; then
  cat autologin.txt
elif [ $# -eq 1 ]; then
  echo $1 > autologin.txt
else
  exit 1
fi

