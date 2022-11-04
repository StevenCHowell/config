#!/bin/bash -f

# Remove Spotlight managed preferences
sudo rm -rf /Library/Managed\ Preferences/*Spotlight*
sudo rm -rf /Library/Managed\ Preferences/*/*Spotlight*

# Kill Spotlight
sudo killall Spotlight
