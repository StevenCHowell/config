#!/bin/bash -f

[[ ${#@} -eq 0 ]] && {
   echo "Usage: sync_computer.sh  local|remote"  
   echo "       Sync current dir in {local|remote} computer."
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
    OPTIONS="-e ssh -auv --progress --delete --delete-after -b --backup-dir=$incre_dir --ignore-errors --exclude-from=$HOME/.rsync_exclude"
else
    OPTIONS="-e ssh -auv --progress --ignore-errors --exclude-from=$HOME/.rsync_exclude"
fi

#REMOTEIP=128.164.237.26    # bioforce corcoran
REMOTEIP=161.253.36.12 # 161.253.72.20    # bioforce SEH

if [ "$1" == "local" ] ; then
    if [ `hostname` == "bioforce" ] ; then
	echo "You are not supposed to run rsync from <bioforce server>"
    else
	echo "Copy <$DIR> from $REMOTEIP to `hostname` ..."
        \rsync $OPTIONS $USER@$REMOTEIP:$DIR/ $DIR/
    fi
fi

if [ $1 == "remote" ] ; then

    declare -a mycomputers=("pheonix" "pmint" "office" "thor"
    "loki" "falcon" "aurora" "sassie" "yoda" "P858549")

    for ipc in "${mycomputers[@]}"
    do
      if [ `hostname` == $ipc ] ; then
	  echo "Copy <$DIR> from `hostname` to $REMOTEIP ..."
	  \rsync $OPTIONS  $DIR/ $USER@$REMOTEIP:$DIR/
      else 
	  echo "`hostname` did not match" $ipc
      fi
    done
fi

if [ $1 == "backup" ] ; then

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
fi



#    if [ `hostname` == "Lab-steve" ] ; then
#	echo "Copy <$DIR_REM> from server to lab desktop <$DIR>..."
#        \rsync $OPTIONS schowell@$REMOTEIP:$DIR/ $DIR/
#    else
#	echo "Copy <$DIR_REM> from server to desktop <$DIR>..."
#        \rsync $OPTIONS schowell@$REMOTEIP:$DIR_REM/ $DIR/
#    fi

#if [ $1 == "remote" ] ; then
    REMOTEIP=128.164.237.26
    BACKUP=/home/schowell/Dropbox/backup
#    rsync -d $BACKUP/.ssh/  /home/schowell/Dropbox/gw_phd/.ssh/
#    rsync $BACKUP/.bash_aliases  $BACKUP/.bashrc  $BACKUP/.rsync_exclude  /home/schowell/Dropbox/gw_phd/
#    rsync -d $BACKUP/.xemacs/ /home/schowell/Dropbox/gw_phd/.xemacs/
#    echo "Updated files from <$BACKUP>..."


if [ $1 == "backup" ] ; then
    DIR_REM=/${DIR#/home/schowell/Dropbox/}
    if [ `hostname` == "schowell-laptop" ] ; then
	echo "Copy <$DIR> from this computer to XPORTER <$DIR>..."
        \rsync $OPTIONS  $DIR/ /media/XPORTER/$DIR_REM/
    fi
fi

# synchronize all relevant directories
declare -a pubdirs=("/home/gwdata/" "/home/programs/" "/home/software")
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
