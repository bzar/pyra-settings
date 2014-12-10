#!/bin/bash

localtime=/etc/localtime
if [ ! -f $localtime ]; then
  ln -s /usr/share/zoneinfo/Europe/London $localtime
fi

if [ $# -eq 0 ]; then
  ls -l $localtime | sed -r 's/.* \/usr\/share\/zoneinfo\/([^\/]*).*/\1/'
  ls -l $localtime | sed -r 's/.* \/usr\/share\/zoneinfo\/[^\/]*\/(.*)/\1/'
elif [ $# -eq 2 ]; then
  rm $localtime
  ln -s /usr/share/zoneinfo/$1/$2 $localtime
else
  exit 1
fi

