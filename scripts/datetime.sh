#!/bin/bash

if [ $# -eq 0 ]; then
  date -Iseconds
elif [ $# -eq 1 ]; then
  date -Iseconds -s $1
else
  exit 1
fi

