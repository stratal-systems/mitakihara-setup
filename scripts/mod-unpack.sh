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
	targetdir="./modules.unpack/${mod%".tar.zst"}"
	mkdir -p "$targetdir"
	tar xf ./modules/$mod --directory "$targetdir"
done

