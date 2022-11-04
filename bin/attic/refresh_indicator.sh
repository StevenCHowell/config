#!/bin/bash -f

while [[ TRUE ]] ; do
    killall indicator-multiload
    indicator-multiload &
    date
    echo "waiting 12 hours ...."
    sleep 3600
    echo "11 hours left ...."
    sleep 3600
    echo "10 hours left ...."
    sleep 3600
    echo "9 hours left ...."
    sleep 3600
    echo "8 hours left ...."
    sleep 3600
    echo "7 hours left ...."
    sleep 3600
    echo "6 hours left ...."
    sleep 3600
    echo "5 hours left ...."
    sleep 3600
    echo "4 hours left ...."
    sleep 3600
    echo "3 hours left ...."
    sleep 3600
    echo "2 hours left ...."
    sleep 3600
    echo "1 hours left ...."
    sleep 3600
done
