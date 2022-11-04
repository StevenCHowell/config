#!/usr/bin/env zsh

# usage:
# $cd ~/Dropbox/Camera\ Uploads/
# $date_sort.sh 2014 ~/Pictures/ pictures steve

year=$1
path=$2
if [ "$3" == "pictures" ] ; then
    for i in {12..10} 0{9..1} ; do
        dir=$path/$year/$i-$year/$4Cell
        echo making $dir directory
        mkdir -p $dir
        date=$year-$i-01T00:00:00
        find ./ -maxdepth 1 -newermt $date -exec mv "{}" $dir \;
    done
else
    echo sorting files for $year into $path
    for i in {12..10} 0{9..1} ; do
        echo making $path$i-$year directory
        mkdir -p $path$year/$i-$year
        date=$year-$i-01T00:00:00
        find ./ -maxdepth 1 -newermt $date -exec mv "{}" $path$year/$i-$year/ \;
    done
fi
