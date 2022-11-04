#!/bin/bash
echo "$# parameters";
echo Using '$*';
for p in $*;
do
    echo "[$p]";
done;
echo Using '"$*"';
for p in "$*";
do
    echo "[$p]";
done;
echo Using '$@';
for p in $@;
do
    echo "[$p]";
done;
echo Using '"$@"';
for p in "$@";
do
    echo "[$p]";
done
