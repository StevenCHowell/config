#!/bin/sh
#shows the time and date, lists all logged-in users, and gives the system uptime, and saves this into a log file

#generate the filename
year=$(date +%y)    # gives the year in 2 digit format
month=$(date +%m)   # 2 digit month
day=$(date +%d)     # 2 digit day
filename=compStat.$year$month$day

date>>$filename
who>>$filename
#users
uptime>>$filename
