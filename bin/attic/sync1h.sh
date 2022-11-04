#!/bin/bash -f

[[ ${#@} -eq 0 ]] && {
   echo "Usage: sync1h.sh  [remote|local] [onsager|aurora|odin|ncnr] "
   echo "       mySync with sleeping time."
   exit 0
}

while [[ TRUE ]] ; do

    mySync.sh "$1" "$2"
    echo "wait 1 hour ...."
    sleep 3600
done
exit
