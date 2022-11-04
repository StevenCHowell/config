#!/bin/bash -f

[[ ${#@} -eq 0 ]] && {
   echo "Usage: x9_sync.sh  sleep_time=30"  
   echo "       Sync with sleeping time."
   exit 0
}

# set the options: --stats

DIR=`pwd`
# create the incremental backup directory
incre_dir=`date +%Y%m%d`
incre_dir=$HOME/trashcan/`date +%Y%m%d`

while [[ TRUE ]] ; do

# only synchronize selected file types   
#    rsync -av --include="*_cz.tif" --include="gline121117a" --include="gline121118" --include="gline121119" --include="gline121117" --include="gline121117" --exclude="*"  --rsh="sshpass -p CThrooMe ssh -l specuser" g1hutch.chess.cornell.edu:/home/specuser/Qiu/G1_11_18_12/ /home/gwdata/1211CHESS/

#    rsync -auv --delete  -b --backup-dir=$incre_dir --rsh="sshpass -p x9user ssh -l x9user" 172.16.1.1:/home/x9user/data/2013C2/Sol.Jul/xqiu/ /home/gwdata/1307NSLSx9/
    rsync -auv -b --backup-dir=$incre_dir --rsh="sshpass -p x9user ssh -l x9user" 172.16.1.1:/home/x9user/data/2014C2/Sol.Jun/Qiu/ /home/gwdata/1406NSLSx9/

    echo "wait 60 seconds ...."
    sleep 60
done
exit
