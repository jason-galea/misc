#!/usr/bin/bash


### Check for comment
if [ "$#" -eq 0 ]; then
    echo
    echo "Please include a commit message (no quotes required)"
    echo
    exit
fi


### Vars
MESSAGE="\"$*\""
COMMANDS=(
    "pull"
    "add -A"
    "status"
    "commit -m $MESSAGE"
    "push"
)


### Begin
for c in "${COMMANDS[@]}"; do
    echo "$ git $c"
    bash -c "git $c"
    # git $c
    echo
done
