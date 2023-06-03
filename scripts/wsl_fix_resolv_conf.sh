#!/usr/bin/bash


### Force root
if [[ $(/usr/bin/id -u) -ne 0 ]]; then
    echo "Please run script as root"
    exit
fi

### Vars
#IP=$(ip r | grep default | sed 's/.*via //' | sed 's/ dev.*//')
IP="10.1.1.101"
DEST="/etc/resolv.conf"


### Rebuild from scratch
echo "" > $DEST
echo "search galea.lan" >> $DEST
echo "nameserver $IP" >> $DEST


### Output
echo
echo "$ cat $DEST"
cat $DEST
echo