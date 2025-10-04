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
	head -c 2048 /dev/urandom > "./modules.unpack/$mod/.noise" || exit 9
	tar caf "./modules/${mod}.tar.zst" . --directory "./modules.unpack/$mod"
done

