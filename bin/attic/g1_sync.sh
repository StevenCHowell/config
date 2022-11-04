#!/bin/bash -f

[[ ${#@} -eq 0 ]] && {
   echo "Usage: g1_sync.sh  sleep_time=10"  
   echo "       Sync with sleeping time."
   exit 0
}

# set the options: --stats

DIR=`pwd`
# create the incremental backup directory
incre_dir=`date +%Y%m%d`
incre_dir=$HOME/trashcan/`date +%Y%m%d`

while [[ TRUE ]] ; do
   
    rsync -av --include="*_cz.tif" --include="gline121117" --exclude="*"  --rsh="sshpass -p CThrooMe ssh -l specuser" g1hutch.chess.cornell.edu:/home/specuser/Qiu/G1_11_17_12/ /home/gwdata/1211CHESS/

    echo "wait 10 seconds ...."
    sleep 10
done
exit
