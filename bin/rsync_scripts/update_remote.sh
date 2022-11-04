#!/bin/bash
REMOTEIP=161.253.36.7
USERNAME=schowell
incre_dir=$HOME/trashcan/`date +%Y%m%d`
OPTIONS="-e ssh -auv --progress --ignore-errors --delete-after -b --backup-dir=$incre_dir --exclude-from /home/schowell/Dropbox/backup/.rsync_exclude"
LOG=/home/data/schowell_data/backup/dropbox_sync_logs/`date +%y%m%d_%A`.log

DIR=/home/schowell/Dropbox/gw_phd/
eval echo remote sync from ncnr to aurora: rsync $OPTIONS $DIR $USERNAME@$REMOTEIP:$DIR >> $LOG
eval \rsync $OPTIONS $DIR $USERNAME@$REMOTEIP:$DIR >> $LOG 2>&1
eval echo >> $LOG

scp $LOG $USERNAME@$REMOTEIP:/home/schowell/Dropbox/dropbox_sync_logs/
