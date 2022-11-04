#!/bin/bash -f

[[ ${#@} -eq 0 ]] && {
   echo "Usage: sync_computer.sh  keep|delete"  
   echo "       Sync current dir in {keep|delete} computer."
   exit 0
}

DIR=`pwd`
DIR_BK=/home/schowell/locker
DIR_REM=/${DIR#/home/schowell/}
incre_dir=`date +%Y%m%d`
incre_dir=$HOME/trashcan/`date +%Y%m%d`

# set the options: --stats
# REMOTEIP=128.164.237.98   #Sparticus
echo "$1"
if [ "$1" == "delete" ] ; then
    OPTIONS="-e ssh -auv --progress --delete --delete-delay -b --backup-dir=$incre_dir --ignore-errors --exclude-from=$HOME/.rsync_exclude"
else
    OPTIONS="-e ssh -auv --progress --ignore-errors --exclude-from=$HOME/.rsync_exclude"
fi

echo "Backup <$DIR> to <$DIR_BK$DIR_REM>..."
\rsync $OPTIONS $DIR/ $DIR_BK$DIR_REM/



#s 
#s if [ `hostname` == "steve-K42Jc" ] ; then
#s     echo "Backup <$HOME> from laptop to <$DIR_BK> on lab computer..."
#s     \rsync $OPTIONS $HOME/ schowell@$REMOTEIP:$DIR_BK/laptop/
#s fi
#s 
#s if [ `hostname` == "schowell-desktop" ] ; then
#s     echo "Copy <$HOME_REM> from desktop to <$DIR_BK> on lab computer..."
#s     \rsync $OPTIONS $HOME/ schowell@$REMOTEIP:$DIR_BK/desktop/
#s fi
