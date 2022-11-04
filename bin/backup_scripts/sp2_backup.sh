#!/bin/bash

dest=/home/backup/entropy/state/partition2
src=odinrsync@entropy.chem.utk.edu:/state/partition2
log=/home/backup/rsync_logs/sp2_backup_`date +%Y%m%d`.log

mkdir -p $dest

limit=31250 # 31250 KBps = 250 Mbps
# limit=12500 # 12500 KBps = 100 Mbps

rsync -e ssh -saAX --info=progress2 --bwlimit=$limit --numeric-ids --progress --ignore-errors --delete --exclude=lost+found/ $src/ $dest/ > $log
