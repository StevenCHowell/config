#!/bin/bash -f

[[ ${#@} -eq 0 ]] && {
   echo "Usage: dir_sync.sh  local|remote [remote_ip]"  
   echo "       Sync current dir in {local|remote} computer."
   exit 0
}

DIR=`pwd`
# create the incremental backup directory
incre_dir=`date +%Y%m%d`
incre_dir=$HOME/trashcan/`date +%Y%m%d`

# set the options: --stats
OPTIONS="-e ssh -auv --progress --delete --delete-delay -b --backup-dir=$incre_dir --ignore-errors --exclude-from=$HOME/.rsync_exclude"
#OPTIONS="-e ssh -auv --progress --delete --delete-during --ignore-errors"

# Default remote: lab server: xray
#REMOTEIP=128.164.238.45
REMOTEIP=128.164.237.26

[[ ${#@} -eq 2 ]] && [[ $2 != "all" ]] && {
REMOTEIP=$2
}

if [ $1 == "local" ] ; then

    if [ `hostname` == "bioforce" ] ; then
	echo "You are not supposed to run rsync from <bioforce server>"
    else
	echo "Copy <$DIR> from $REMOTEIP to `hostname` ..."
        \rsync $OPTIONS $USER@$REMOTEIP:$DIR/ $DIR/
    fi

fi

if [ $1 == "remote" ] ; then

    declare -a mycomputers=("$USER-gwulaptop" "Qiu-OptiPlex"
    "$USER-gwdesktop" "$USER-nihlaptop" "$USER-desktop"
    "$USER-ThinkPad" "bioforce" "Precision-390" "xqiu-OptiPlex-745")

    for ipc in "${mycomputers[@]}"
    do
      if [ `hostname` == $ipc ] ; then
	  echo "Copy <$DIR> from `hostname` to $REMOTEIP ..."
	  \rsync $OPTIONS  $DIR/ $USER@$REMOTEIP:$DIR/
      fi
    done
fi

# synchronize all relevant directories
declare -a pubdirs=("/home/$USER" "/home/exptdata" "/home/gwdata/" "/home/programs/" "/home/software")
[[ ${#@} -eq 2 ]] && [[ $2 == "all" ]] && {
    for eachdir in "${pubdirs[@]}"
      do
      echo ""
      if [ -r $eachdir ] ; then
	  echo "`date`: Running <$0 $1> in directory <$eachdir>"
	  cd $eachdir
	  $0 $1
      else
	echo "WARNING: <$eachdir> does not exist on `hostname`, SKIP!"  
      fi
    done
}