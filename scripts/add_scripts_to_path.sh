#!/usr/bin/bash

BIN_DIR="$HOME/.local/bin"
SCRIPT_DIR=$(dirname $(readlink -f $0))


### Delete symlinks OR create bin dir
if [[ -d $BIN_DIR ]]; then
    echo -e "\n==> Deleting old symlinks"
    for SYMLINK in $(find $BIN_DIR -type l); do ### Deals with 0 results
        rm $SYMLINK
    done
else
    echo -e "\n==> Creating '$BIN_DIR'"
    mkdir $BIN_DIR
fi


### Create
echo -e "\n==> Creating new symlinks"
for SCRIPT in $(find $SCRIPT_DIR -type f -iname "*.sh"); do
    echo "ln -s $SCRIPT $BIN_DIR/$(basename $SCRIPT .sh)"
    ln -s $SCRIPT $BIN_DIR/$(basename $SCRIPT .sh)
done


### Signpost
echo -e "\n==> Displaying symlinks in '$BIN_DIR'"
ls -lh $BIN_DIR

echo -e "\n==> SUCCESS! (hopefully? :O)"
