#!/bin/bash -f

[[ ${#@} -eq 0 ]] && {
   echo "Usage: sync60s.sh  [remote|local] [onsager|aurora|odin|ncnr] "
   echo "       mySync with sleeping time."
   exit 0
}

while [[ TRUE ]] ; do

    mySync.sh "$1" "$2"
    echo "wait 60 seconds ...."
    sleep 60
done
exit
