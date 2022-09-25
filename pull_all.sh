#!/usr/bin/bash


### Vars
# PWD=$(pwd)


### Dealing with spaces is NOT worth it lol
# # IFS=$'\n'
# for repo in $(find -type d -name '.git' | sed 's/.git//' | grep -v crystal); do
# # for repo in $(find -type d -name '.git' | sed 's/.git//' | sed 's/^/"/' | sed 's/$/"/'); do
# # for repo in $(find -type d -name '.git' | sed 's/.git//' | sed 's/  */\\\ /g'); do
# # for repo in $(find $PWD/ -type d -name '.git' | grep -v crystal | sed 's/.git//' | sed 's/  */\\\ /g'); do
#     echo "$ git -C $repo pull"
#     git -C $repo pull
#     echo
# done
# # unset IFS


### Begin
for repo in $(find -type d -name '.git' | sed 's/.git//' | grep -v crystal | grep -v "!!!"); do
    echo "$ git -C $repo pull"
    git -C $repo pull
    echo
done

