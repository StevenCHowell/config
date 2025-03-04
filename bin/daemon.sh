#!/bin/bash
port=12345
nc -l $port | while read msg; do zenity --info --text "$msg"; done
