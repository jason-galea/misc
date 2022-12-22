#!/bin/bash

CURRENT_TIME=$(date +"%d-%m-%y_%H-%M-%S")

echo "==> Copying source dir: '/mnt/c/Users/jg/Documents/Mirrors\ Edge\ Catalyst/settings/'"
echo "==> To destination dir: '/mnt/d/Games/Mirrors\ Edge\ Catalyst/Save\ Backups/mirror_edge_catalysts_savebackup_$CURRENT_TIME'"

cp -R \
    /mnt/c/Users/jg/Documents/Mirrors\ Edge\ Catalyst/settings/ \
    /mnt/d/Games/Mirrors\ Edge\ Catalyst/Save\ Backups/mirror_edge_catalysts_savebackup_$CURRENT_TIME

