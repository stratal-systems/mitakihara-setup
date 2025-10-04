#!/bin/bash

if [ -n "$1" ]
then
	mods="$@"
else
	mods=$(ls modules.unpack)
fi

set -x

for mod in $mods
do
	noisepath="./modules.unpack/$mod/.noise"
	if ! [ -f "$noisepath" ]
	then
		head -c 2048 /dev/urandom > $noisepath || exit 9
	fi
	tar caf "./modules/${mod}.tar.zst" . --directory "./modules.unpack/$mod"
done

