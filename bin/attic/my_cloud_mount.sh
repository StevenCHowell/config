#!/usr/bin/env bash

### CCAS Cloud Drive Mount -- Research, Home, Group Drives	###
### Ver R01.00.00 -- Ben Carleton, benc@email.gwu.edu 		###

# First run: mkdir ~/cloud_home ~/cloud_research ~/cloud_group ~/cloud_students_group
# On Ubuntu: Need to run sudo apt-get install cifs-utils ldap-utils
# User needs to have sudo permission for at least mount and umount commands

THE_USER=$(id -u $SUDO_USER)
THE_GROUP=$(id -g $SUDO_GROUP)
CURRENT_USER=$SUDO_USER
MY_ID=$(id -u)

if [ "$MY_ID" != "0" ] #Root only
  then
    echo "Please run this script as root (sudo)"
    exit
fi

#echo "   ____ ____    _    ____     ____ _                 _ ";
#echo "  / ___/ ___|  / \  / ___|   / ___| | ___  _   _  __| |";
#echo " | |  | |     / _ \ \___ \  | |   | |/ _ \| | | |/ _\` |";
#echo " | |__| |___ / ___ \ ___) | | |___| | (_) | |_| | (_| |";
#echo "  \____\____/_/   \_\____/   \____|_|\___/ \__,_|\__,_|";
#echo "                                                       ";

echo "CCAS Cloud Drive Mount Script"
echo "If you are off-campus, please make sure the VPN is connected."
#s echo "Please enter your cloud username (or enter to use $CURRENT_USER)"
#s read new_user 
#s 
#s # If the user doesn't want to use the default username (their current username)
#s if [ -n "$new_user" ]
#s   then
#s     CURRENT_USER=$new_user
#s fi

CURRENT_USER=Showell1

# Capture password
#s echo "Please enter your cloud password and press enter (it will not be displayed):"
#s read -s password
password='2$RACEcar$2'


# Query Cloud Domain Controller LDAP for dn and memberOf
LDAP_Q=$(ldapsearch -LLL -H ldap://stratus.cloud.ccas.gwu.edu -b 'dc=cloud,dc=ccas,dc=gwu,dc=edu' -D "cloud\\$CURRENT_USER" -w "$password" "(sAMAccountName=$CURRENT_USER)" dn memberOf)

USER_DN=""
HOME_PATH=""
# Get the user's DN so we know where their home drive is
while read -r line; do
  if [[ "$line" == "dn: "* ]]
    then
      USER_DN=$line
    fi
done <<< "$LDAP_Q"

#See what the DN is so we know where to mount
if [[ "$USER_DN" == *"Faculty"* ]]
	then
		HOME_PATH="faculty$"
	fi

if [[ "$USER_DN" == *"Student"* ]]
	then
		HOME_PATH="student$"
	fi

if [[ "$USER_DN" == *"OTS"* ]]
	then
		HOME_PATH="ots$"
	fi

if [[ "$USER_DN" == *"Staff"* ]]
	then
		HOME_PATH="staff$"
	fi

echo "Now mounting cloud drives. ($HOME_PATH)"
echo "Mounting home drive"
umount /home/$SUDO_USER/cloud_home > /dev/null 2>&1
mount -t cifs -o username=$CURRENT_USER,password=$password,uid=$THE_USER,gid=$THE_GROUP,dir_mode=0700,file_mode=0600 //fb-cluster-001-fs.cloud.ccas.gwu.edu/$HOME_PATH/$CURRENT_USER /home/$SUDO_USER/cloud_home

echo "Mounting group drive"
umount /home/$SUDO_USER/cloud_group > /dev/null 2>&1
mount -t cifs -o username=$CURRENT_USER,password=$password,uid=$THE_USER,gid=$THE_GROUP,dir_mode=0700,file_mode=0600 //fb-cluster-001-fs.cloud.ccas.gwu.edu/group$ /home/$SUDO_USER/cloud_group

echo "Mounting students-group drive"
umount /home/$SUDO_USER/cloud_students_group > /dev/null 2>&1
mount -t cifs -o username=$CURRENT_USER,password=$password,uid=$THE_USER,gid=$THE_GROUP,dir_mode=0700,file_mode=0600 //fb-cluster-001-fs.cloud.ccas.gwu.edu/students-group$ /home/$SUDO_USER/cloud_students_group

echo "Mounting research drive"
umount /home/$SUDO_USER/cloud_research > /dev/null 2>&1
mount -t cifs -o username=$CURRENT_USER,password=$password,uid=$THE_USER,gid=$THE_GROUP,dir_mode=0700,file_mode=0600 //fb-research-fs.cloud.ccas.gwu.edu/research$ /home/$SUDO_USER/cloud_research

