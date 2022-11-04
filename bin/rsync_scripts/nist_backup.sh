#!/bin/bash -f
[[ ${#@} -eq 0 ]] && {
   echo "Usage: nist_backup.sh  <OPTIONS>"
   exit 0
}

# set the options: --stats
OPTIONS="-e ssh -auv --progress --ignore-errors --exclude-from=$HOME/.rsync_exclude"
for var in "$@"
do
    if [ "$var" == "delete" ] ; then
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

REMOTEIP=192.168.62.63
echo "using freenas as remote computer"

USERNAME=$USER
DIR=`pwd`
DIR_REM=/mnt/megamind/nist/${DIR#/media/schowell/odin/}
echo "Copy <$DIR> from this computer to external backup <$DIR>..."
echo
echo "Creating the directory: "
echo "mkdir -p $DIR_REM/"
echo
echo "Running the following rsync command: "
echo "rsync $OPTIONS $DIR/ $USERNAME@REMOTEIP:$DIR_REM/"
echo
ssh $USERNAME@$REMOTEIP "mkdir -p $DIR_REM/"
rsync $OPTIONS $DIR/ $USERNAME@$REMOTEIP:$DIR_REM/
