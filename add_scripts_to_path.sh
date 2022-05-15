#!/usr/bin/bash


# ### Force root???
# if [[ $(/usr/bin/id -u) -ne 0 ]]; then
#     echo "Please run script as root"
#     exit
# fi


### Check/create ~/.local/bin/misc_scripts


### Set permissions on local bin


### For each script "*.sh" in misc_scripts:
### ln -s $script ~/.local/bin/misc_scripts/$($script.strip(".sh")) ???