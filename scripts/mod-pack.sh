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
	tar caf "./modules/${mod}.tar.zst" . --directory "./modules.unpack/$mod"
done

