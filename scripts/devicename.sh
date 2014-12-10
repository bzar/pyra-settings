#!/bin/bash

if [ ! -f /etc/hostname ]; then
  echo "pyra" > test.txt
fi

if [ $# -eq 0 ]; then
  cat /etc/hostname
elif [ $# -eq 1 ]; then
  hostname=$1
  echo $hostname > /etc/hostname
  echo "127.0.0.1 localhost.localdomain localhost $hostname" > /etc/hosts
  hostname -F /etc/hostname
else
  exit 1
fi

