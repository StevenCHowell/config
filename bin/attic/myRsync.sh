#!/bin/bash -f
[[ ${#@} -eq 0 ]] && {
   echo "Usage: myRsync.sh sourceDir delete" 
   echo "       Sync sourceDir to ./"
   exit 0
}

# set the options: --stats

DIR=`pwd`
# create the incremental backup directory
incre_dir=`date +%Y%m%d`
incre_dir=$HOME/trashcan/`date +%Y%m%d`

# set the options: --stats
echo "$2"
if [ "$2" == "delete" ] ; then
    OPTIONS="-e ssh -auv --progress --delete-after -b --backup-dir=$incre_dir --ignore-errors --exclude-from=$HOME/Dropbox/backup/.rsync_exclude"
    echo "excess files to the trashcan"
elif [ "$2" == "win" ] ; then
    OPTIONS="-e ssh -rltDuv -O --modify-window=1 --progress --no-group -b --backup-dir=$incre_dir --ignore-errors --exclude-from=$HOME/.rsync_exclude"
else
    OPTIONS="-e ssh -auv --progress --ignore-errors --exclude-from=$HOME/.rsync_exclude"
    echo "ignoring excess files"
fi

echo "Copy <$1> to <$DIR> ..."
\rsync $OPTIONS $1/ $DIR/
