#!/bin/bash -f

cd /home/schowell/data/code/pylib/packtpub-crawler/
while [[ TRUE ]] ; do

    packtpub-crawler.sh
    sleep 86340
done
exit
