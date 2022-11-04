#!/bin/bash -f

[[ ${#@} -eq 0 ]] && {
   echo "Usage: sync_g1_2014.sh  sleep_time=10"  
   echo "       Sync with sleeping time."
   exit 0
}

# set the options: --stats

DIR=`pwd`
TIME=$1

# create the incremental backup directory
incre_dir=`date +%Y%m%d`
incre_dir=$HOME/trashcan/`date +%Y%m%d`

while [[ TRUE ]] ; do
   
    rsync -av --include="*" --include="gline121117a" --include="gline121118" --include="gline121117" --include="gline121117" --exclude="*.tiff"  --rsh="sshpass -p CThrooMe ssh -l specuser" g1hutch.chess.cornell.edu:/home/specuser/Qiu/ /home/gwdata/1406CHESS/

    rsync -av --include="*"  --rsh="sshpass -p CThrooMe ssh -l det" dec760.dynamic.chess.cornell.edu:/home/det/data/Qiu/ /home/gwdata/1406CHESS/

    echo "wait $TIME seconds ...."
    sleep $TIME
done
exit
