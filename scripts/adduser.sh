#!/bin/bash

if [ $# -eq 0 ]; then
  getent passwd "$(whoami)" | cut -d ':' -f 5
  whoami
  echo "****"
elif [ $# -eq 3 ]; then
  FULLNAME=$1
  USERNAME=$2
  PASSWORD=$3
  useradd -c "$NAME,,," -G adm,audio,cdrom,netdev,plugdev,users,video,wheel,dialout "$USERNAME"
  echo "$USERNAME:$PASSWORD" | chpasswd
else
  exit 1
fi

