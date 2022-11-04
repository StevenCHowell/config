#!/bin/bash -f

[[ ${#@} -eq 0 ]] && {
   echo "Usage: sync10s.sh  sleep_time=10"  
   echo "       dir_sync with sleeping time."
   exit 0
}

while [[ TRUE ]] ; do

    dir_sync.sh "$1"
    echo "wait 10 seconds ...."
    sleep 10
done
exit
