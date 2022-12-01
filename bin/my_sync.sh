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

declare -a mycomputers=("aurora" "loki" "thor" "yoda" "freenas" "red5" "heimdall")

# set the options: --stats
OPTIONS="-e ssh -auv --progress --ignore-errors --exclude-from=$HOME/.rsync_exclude"
for var in "$@"
do
    if [ "$var" == "delete" ] ; then
        # create the incremental backup directory
        if [[ ( "$2" == "onsager_old" ) && ( "$1" == "remote" ) ]] ; then
            incre_dir=${HOME/home/share_home}/trashcan/`date +%Y%m%d`
        elif [[ ( "$2" == "ocho" ) && ( "$1" == "remote" ) ]] ; then
            incre_dir=${HOME/home/Users}/trashcan/`date +%Y%m%d`
        else
            incre_dir=$HOME/trashcan/`date +%Y%m%d`
        fi
        OPTIONS=$OPTIONS" --delete-after -b --backup-dir=$incre_dir"
        echo "excess files to the trashcan"
    elif [ "$var" == "small" ] ; then
        OPTIONS=$OPTIONS" --max-size=512MB"
        echo "only syncing files < 512MB"
    elif [ "$var" == "tiny" ] ; then
        OPTIONS=$OPTIONS" --max-size=512KB"
        echo "only syncing files < 512KB"
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

if [ "$2" == "aurora" ] ; then
    REMOTEIP=192.168.62.101
elif [ "$2" == "loki" ] ; then
    REMOTEIP=161.253.36.74
elif [ "$2" == "thor" ]; then
    REMOTEIP=192.168.62.99
elif [ "$2" == "yoda" ]; then
    REMOTEIP=192.168.62.95  # guess
elif [ "$2" == "freenas" ] ; then
    REMOTEIP=192.168.62.63
elif [ "$2" == "red5" ] ; then
    REMOTEIP=192.168.62.98
elif [ "$2" == "heimdall" ]; then
    REMOTEIP=192.168.62.97
fi
echo "using $2 as remote computer"

if [[ $(hostname -s) = P6* ]] ; then
    DIR_REM=${DIR_REM/Users/home}
elif [ `hostname` == "onsager" ] ; then
    DIR_REM=${DIR_REM/share_home/home}
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
elif [ $1 == "backup" ] ; then
    DIR_REM=${DIR#/home/}
    echo "Copy <$DIR> from this computer to external backup <$DIR>..."
    echo
    echo "Creating the directory: "
    echo "mkdir -p /media/schowell/extBackup2/$DIR_REM/"
    echo
    echo "Running the following rsync command: "
    echo "rsync $OPTIONS  $DIR/ /media/schowell/extBackup2/$DIR_REM/"
    echo
    mkdir -p /media/schowell/extBackup2/$DIR_REM/
    rsync $OPTIONS  $DIR/ /media/schowell/extBackup2/$DIR_REM/
elif [ $1 == "backdown" ] ; then
    DIR_REM=${DIR#/home/}
    echo "Copy <$DIR> from external backup to this computer..."
    echo
    echo "Running the following rsync command: "
    echo "rsync $OPTIONS  /media/schowell/extBackup2/$DIR_REM/ $DIR/"
    echo
    rsync $OPTIONS  /media/schowell/extBackup2/$DIR_REM/ $DIR/
else
    echo "Please specify local|remote|backup"
fi

#s # synchronize all relevant directories
#s declare -a pubdirs=("/home/gwdata/" "/home/programs/" "/home/software")
#s [[ ${#@} -eq 2 ]] && [[ $2 == "all" ]] && {
#s     for eachdir in "${pubdirs[@]}"
#s     do
#s         echo ""
#s         if [ -r $eachdir ] ; then
#s 	    echo "`date`: Running <$0 $1> in directory <$eachdir>"
#s 	    cd $eachdir
#s 	    $0 $1
#s         else
#s 	    echo "WARNING: <$eachdir> does not exist on `hostname`, SKIP!"
#s         fi
#s     done
#s }
