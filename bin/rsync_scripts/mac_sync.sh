#!/bin/bash -f
[[ ${#@} -eq 0 ]] && {
   echo "Usage: sync_computer.sh  local|remote"  
   echo "       Sync current dir in {local|remote} computer."
   exit 0
}

# set the options: --stats
USERNAME=$USER
DIR=`pwd`
DIR_REM=`pwd`

declare -a mycomputers=("P630552" "P643652")

# set the options: --stats
OPTIONS="-e ssh -auv --progress --ignore-errors"
for var in "$@"
do
    if [ "$var" == "delete" ] ; then
        # create the incremental backup directory                                                                                                                   
        incre_dir=$HOME/trashcan/`date +%Y%m%d`
        OPTIONS=$OPTIONS" --delete-after -b --backup-dir=$incre_dir"
        echo "excess files to the trashcan"
    elif [ "$var" == "no_dcd" ] ; then
        OPTIONS=$OPTIONS" --exclude '*.dcd'"
        echo "ignoring dcd files"
    elif [ "$var" == "no_log" ] ; then
        OPTIONS=$OPTIONS" --exclude '*.log'"
        echo "ignoring log files"
    elif [ "$var" == "limit1" ] ; then
        OPTIONS=$OPTIONS" --bwlimit=1000"
        echo "limiting bandwidth to 1MB/s"
    elif [ "$var" == "limit5" ] ; then
        OPTIONS=$OPTIONS" --bwlimit=5000"
        echo "limiting bandwidth to 5MB/s"
    elif [ "$var" == "win" ] ; then
        OPTIONS="-rltDuv -O --modify-window=1 --no-group -b --backup-dir=$incre_dir --ignore-errors"
        echo "syncing with windows"
    fi
done
#OPTIONS=$OPTIONS" --exclude-from=$HOME/.rsync_exclude"

#echo Options: $OPTIONS
# a: archive
# u: update
# v: verbose
# r: recursive
# l: links
# t: times
# D: preserve device and special files (same as: --devices --specials)

if [ "$2" == "ocho" ] ; then
    REMOTEIP=129.6.121.114
    echo "using ocho as remote computer"
elif [ "$2" == "air" ] ; then
    REMOTEIP=129.6.226.252
    echo "using air as remote computer"
fi

if [ "$1" == "local" ] ; then
    echo "Copy <$DIR> from $REMOTEIP to `hostname` ..."
    echo
    echo "Running the following rsync command: "
    echo "rsync $OPTIONS  $USERNAME@$REMOTEIP:$DIR_REM/ $DIR/"
    echo
    rsync $OPTIONS $USERNAME@$REMOTEIP:$DIR_REM/ $DIR/
elif [ $1 == "remote" ] ; then
    for ipc in "${mycomputers[@]}"
    do
        if [ `hostname` == $ipc ] ; then
	    echo "Copy <$DIR> from `hostname` to $REMOTEIP ..."
            echo
            echo "Running the following rsync command: "
            echo "rsync $OPTIONS  $DIR/ $USERNAME@$REMOTEIP:$DIR_REM/"
            echo
            ssh $USERNAME@$REMOTEIP "mkdir -p $DIR_REM/"
            rsync $OPTIONS  $DIR/ $USERNAME@$REMOTEIP:$DIR_REM/
        else 
	    echo "`hostname` did not match" $ipc
        fi
    done
else
    echo "Please specify local|remote|backup"
fi

