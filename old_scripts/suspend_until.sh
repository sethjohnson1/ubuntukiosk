#!/bin/bash
# Takes a 24hour time HH:MM as its argument Example: suspend_until 9:30 
# suspend_until 18:45 
# ------------------------------------------------------ Argument check
if [ $# -lt 1 ]; then
    echo "Usage: suspend_until HH:MM"
    exit
fi
# Check whether specified time today or tomorrow
DESIRED=$((`date +%s -d "$1"`))
NOW=$((`date +%s`))
if [ $DESIRED -lt $NOW ]; then
    DESIRED=$((`date +%s -d "$1"` + 24*60*60))
fi
# Kill rtcwake if already running sudo killall rtcwake find this by "man 
# rtcwake" sj note - "freeze" doesn't put anything to RAM or such and 
# requires no hardware, the only one thats works consistently -m mem 
# uses S3 and works on the ZOTAC *only* if you have AHCPI set to "auto" 
# config in the BIOS. If you have it off OR on then it will not wake 
# properly. Heed the hours of time I lost testing this... Freeze is 
# probably fine!
sudo rtcwake -l -m freeze -t $DESIRED &
# feedback echo "Suspending..." give rtcwake some time to make its stuff
sleep 2
# Any commands you want to launch after wakeup can be placed here 
#Remember: sudo may have expired by now sj note - we do not, but I am 
#leaving this as a reminder, but the monitors should already be awake 
#xset dpms force on
# and a fresh console clear
#echo "Good morning!"
