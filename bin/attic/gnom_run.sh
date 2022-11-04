#!/bin/sh

if [ -r gnom.cfg ] ; then
   echo -n "Removing gnom.cfg, Ctrl+C to abort! (any other key will proceed!)"
   read answer
   \rm gnom.cfg
fi

\ln -s $1 gnom.cfg
gnom
\rm gnom.cfg
