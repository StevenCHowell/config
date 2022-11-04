#!/bin/bash -f
# This script is designed to simplify the updating up ssh keys on remote computers.
# It can be used for the following four purposes:
# 
# clean:  
# To remove the ~/.ssh directory from the computer with IP 123.456.78.90
#        updateSSH.sh 123.456.78.90 clean
# 
# public:  
# To copy the public key to the ~/.ssh directory of the computer with IP 123.456.78.90
#        updateSSH.sh 123.456.78.90 public
# 
# private:  
# To copy both the public and private keys to the ~/.ssh directory of the computer with IP 123.456.78.90
#        updateSSH.sh 123.456.78.90 private
#
# local:
# To get both the public and private keys from the computer with IP 123.456.78.90
#        updateSSH.sh 123.456.78.90 local
# 
# test:  
# To test the ssh settings for the computer with IP 123.456.78.90
#        updateSSH.sh 123.456.78.90 test
#
# written by Steven C. Howell on 10 April 2014

[[ ${#@} -lt 2 ]] && {
   echo "Usage: updateSSH.sh  remoteIP public/private/clean/test"  
   echo "       Copy {public|private} ssh keys to remoteIP computer."
   exit 0
}

USER=`whoami`
incre_dir=`date +%Y%m%d`
incre_dir=$HOME/trashcan/`date +%Y%m%d`
OPTIONS="-e ssh -auv --progress --delete --delete-delay -b --backup-dir=$incre_dir --ignore-errors"

if [ "$2" == "clean" ] ; then
    echo "Cleaning out .ssh directory on <$1>"
    ssh $USER@$1 "rm -r ~/.ssh"
elif [ "$2" == "public" ] ; then
    echo "Copying public key to <$1>"
    ssh-copy-id $USER@$1
elif [ "$2" == "private" ] ; then
    echo "Copying private and public key to <$1>"
    ssh-copy-id $USER@$1
    \rsync $OPTIONS ~/.ssh/ $USER@$1:~/.ssh/
    ssh $USER@$1 "ssh-add"    
elif [ "$2" == "local" ] ; then
    echo "Getting private and public key from <$1>"
    \rsync $OPTIONS $USER@$1:~/.ssh/ ~/.ssh/ 
elif [ "$2" == "test" ] ; then
    echo "Testing ssh connection with <$1>"
    ssh $USER@$1
fi
