#!/bin/bash -f
if [ -n "$1" ]; then
SECRET="$1"
else
echo "Paste a base64 encoded, encrypted secret: "
read SECRET
fi
[[ -z "${SECRET}" ]] && return 1
echo SECRET: >&2
    echo -ne "${SECRET}" | base64 --decode | keybase pgp decrypt
echo
