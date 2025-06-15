#!/usr/bin/env zsh

# Note that you should sort the MOST RECENT YEAR FIRST.
#
# usage examples:
#
# $cd ~/Dropbox/Camera\ Uploads/
# $bash date_sort.sh 2014 ~/Pictures/ pictures steve
#
# $cd /mnt/data/smb_share/photos/xfer/some_folder
# $bash date_sort.sh 2024 /mnt/data/smb_share/photos/family_photos pictures misc
#

year=$1
path=$2
if [ "$3" == "pictures" ] ; then
    for i in {12..10} 0{9..1} ; do
        dir=$path/$year/$i-$year/$4
        echo making $dir directory
        mkdir -p $dir
        date=$year-$i-01T00:00:00
        find ./ -maxdepth 1 -newermt $date -exec mv "{}" $dir \;
    done
else
    echo sorting files for $year into $path
    for i in {12..10} 0{9..1} ; do
        echo making $path/$year/$i-$year directory
        mkdir -p $path/$year/$i-$year
        date=$year-$i-01T00:00:00
        find ./ -maxdepth 1 -newermt $date -exec mv "{}" $path/$year/$i-$year/ \;
    done
fi
