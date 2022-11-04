#!/bin/bash
echo These should all be: 2
for foo in /sys/bus/usb/devices/*/power/autosuspend;
do 
    echo 2 > $foo
    eval more $foo
done

echo
echo These should all be: on
for bar in /sys/bus/usb/devices/*/power/level;
do 
    echo on > $bar
    eval more $bar
done
