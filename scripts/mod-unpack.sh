#!/bin/bash

if [ -n "$1" ]
then
	mods="$@"
else
	mods=$(ls modules)
fi

mkdir -p ./modules.unpack || exit 8

set -x

for mod in $mods
do
	if ! [ -f "./modules/$mod" ]
	then
		echo "$mod is not a file, skipping"
		continue
	fi
	tar xf ./modules/$mod --directory ./modules.unpack/${foo%".tar.zst"}
done

