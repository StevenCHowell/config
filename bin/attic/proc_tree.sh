#!/bin/bash
# Print the process tree of the window currently in focus.
# prereqs:
#   sudo apt-get install xdotool pstree

while true; do
   pstree -spaul $(xdotool getwindowpid "$(xdotool getwindowfocus)")
   sleep 2
done
