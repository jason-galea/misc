#!/bin/bash

echo

for DISK in $(lsblk | grep disk | awk '{print $1}'); do

    #echo "/dev/$DISK"

    echo "===> Printing SMART details of disk '/dev/$DISK'"

    smartctl /dev/$DISK -a | grep -E \
        'Model Family|Serial Number|User Capacity|Reallocated_Sector_Ct|Power_On_Hours|Power_Cycle_Count'
    echo

done


