OPTIONS="-e ssh -auv --progress --ignore-errors --exclude-from=$HOME/.rsync_exclude"
\rsync $OPTIONS /home/schowell/data/Dropbox/gw_phd/experiments/paper_tetranucleosome/1307nsls/sasref/completed/ ~/data/mydata/1307nsls_sasref/
