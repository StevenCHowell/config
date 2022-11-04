#!/bin/bash -f
[[ ${#@} -eq 0 ]] && {
   echo "Usage: myBackup.sh  local|remote"  
   echo "       Sync current dir with {local|remote} drive."
   exit 0
}

# set the options: --stats
USERNAME=$USER
DIR=`pwd`
# create the incremental backup directory
incre_dir=`date +%Y%m%d`
incre_dir=$HOME/trashcan/`date +%Y%m%d`

declare -a mycomputers=("pheonix" "frodo" "pmint" "yoda"
    "loki" "thor" "falcon" "aurora" "office" "sassie" 
    "gibbs" "onsager" "charge")

# set the options: --stats
OPTIONS="-e ssh -auv --progress --ignore-errors"
for var in "$@"
do
    if [ "$var" == "delete" ] ; then
        if [ "$1" == "local" ] ; then
            OPTIONS=$OPTIONS" --delete-after -b --backup-dir=$incre_dir"
            echo "excess files to the trashcan"
        else
            OPTIONS=$OPTIONS" --delete-after"
            echo "WARNING: excess DELETED!"
            sleep 3
        fi
    elif [ "$var" == "no_dcd" ] ; then
        OPTIONS=$OPTIONS" --exclude '*.dcd'"
        echo "ignoring dcd files"
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

if [ "$1" == "local" ] ; then
    echo "Copy <$DIR> from $REMOTEIP to `hostname` ..."
    # echo rsync $OPTIONS  $USERNAME@$REMOTEIP:$DIR/ $DIR/
    eval \rsync $OPTIONS ~/mnt/$DIR/ $DIR/
elif [ $1 == "remote" ] ; then
    echo "Copy <$DIR> from `hostname` to $REMOTEIP ..."
    # echo rsync $OPTIONS  $DIR/ $USERNAME@$REMOTEIP:$DIR/
    mkdir -p ~/mnt/$DIR/
    eval \rsync $OPTIONS  $DIR/ ~/mnt/$DIR/
else
    echo "Please specify local|remote"
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
