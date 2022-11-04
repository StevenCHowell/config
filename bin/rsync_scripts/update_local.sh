#!/bin/bash
REMOTEIP=161.253.36.7
USERNAME=schowell
incre_dir=$HOME/trashcan/`date +%Y%m%d`
OPTIONS="-e ssh -auv --progress --ignore-errors --delete-after -b --backup-dir=$incre_dir"
LOG=/home/data/schowell_data/backup/dropbox_sync_logs/`date +%y%m%d_%A`.log

DIR=/home/schowell/Dropbox/gw_phd/
eval echo running this command: rysc $OPTIONS $USERNAME@$REMOTEIP:$DIR/ $DIR/ >> $LOG
eval \rsync $OPTIONS $USERNAME@$REMOTEIP:$DIR/ $DIR/ >> $LOG 2>&1
eval echo >> $LOG
