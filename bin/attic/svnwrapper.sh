#!/bin/sh 

# set the umask so files are group-wriable
umask 002

# call the 'real' svnserve, also passing in the default repo location
exec /usr/bin/svnserve "$@" -r /home/svn
