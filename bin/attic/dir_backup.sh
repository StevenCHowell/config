#!/bin/bash -f

DIR=$HOME/Dropbox/gw_phd/

# create the incremental backup directory
incre_dir=`date +%Y%m%d`
incre_dir=$HOME/trashcan/`date +%Y%m%d`

# set the options: --stats
OPTIONS="-e ssh -auv --progress --delete --delete-after -b --backup-dir=$incre_dir --ignore-errors --exclude-from=$HOME/.rsync_exclude"

REMOTEIP=128.164.237.26    # bioforce

declare -a mycomputers=("pheonix" "pmint" "office" "thor"
    "loki" "falcon" "aurora" "sassie" "yoda")

for ipc in "${mycomputers[@]}"
do
    if [ `hostname` == $ipc ] ; then
        while [[ TRUE ]] ; do
	    echo "Copy <$DIR> from `hostname` to $REMOTEIP ..."
	    \rsync $OPTIONS  $DIR/ $USER@$REMOTEIP:$DIR/
            date
            echo "waiting 4 hours ...."
            sleep 3600
            echo "3 hours left ...."
            sleep 3600
            echo "2 hours left ...."
            sleep 3600
            echo "1 hours left ...."
            sleep 3600
        done
    else 
	echo "`hostname` did not match" $ipc
    fi
done
