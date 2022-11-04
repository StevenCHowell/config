#!/bin/bash
for foo in /sys/bus/usb/devices/*/power/autosuspend;
do 
    eval more $foo
done

echo 
echo These should all be: on
for bar in /sys/bus/usb/devices/*/power/level;
do 
    eval more $bar
done
