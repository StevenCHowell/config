#!/bin/bash

dest=/home/backup/odin/daily/`date +%A`

mkdir -p $dest

rsync -auv --progress --ignore-errors --delete-after --stats /home/schowell/ $dest/
