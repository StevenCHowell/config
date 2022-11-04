DIR=1309/
mkdir $DIR
ls -go ~/Downloads/|sed '/^d/ d' |awk '{ if ( $4 == "Sep" ) print $7 }' |xargs -i mv {} /home/schowell/Downloads/$DIR