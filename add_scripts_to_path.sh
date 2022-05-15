#!/usr/bin/bash


BIN="$HOME/.local/bin"
ME=`basename "$0"`



### Create symbolic links
for s in $(ls *.sh | grep -v "$ME" | sed 's/.sh//'); do
    echo "$ ln -s $s.sh $BIN/$s"
    ln -s $(pwd)/$s.sh $BIN/$s
    echo
done

echo "$ ls -lh $BIN"
ls -lh $BIN

echo "Symbolic links created, please restart your shell"



