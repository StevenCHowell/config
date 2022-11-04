#!/bin/bash

dest=/media/backup/extBackup/schowell/

# mkdir -p $dest

rsync -auv --exclude 'backup/' --progress --ignore-errors --delete-after --stats /home/schowell/ $dest/
