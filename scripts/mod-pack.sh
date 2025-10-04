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
	outpath="./modules/${mod}.tar.zst"
	if ! [ -f "$noisepath" ]
	then
		head -c 2048 /dev/urandom > $noisepath || exit 9
	fi
	rm -f "$outpath" || exit 1
	tar caf "$outpath" . --directory "./modules.unpack/$mod"
done

