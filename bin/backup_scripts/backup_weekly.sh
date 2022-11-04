#!/bin/bash

dest=/home/backup/odin/weekly/week`date +%w`

mkdir -p $dest

rsync -auv --progress --ignore-errors --delete-after --stats /home/schowell/ $dest/
