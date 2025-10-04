#!/bin/bash

if [ -z "$1" ]
then
	echo "Usage: $0 <MODULE> [MODULE...]"
	exit 9
fi

mods="$@"

for mod in $mods
do
	rm -rf /.mod

	if [ -f "./modules/${mod}.tar.zst" ]
	then
		echo "$mod is a file, unpacking"
		tar xf "./modules/${mod}.tar.zst" --directory /
	elif [ -d "./modules/$mod" ]
	then
		echo "$mod is dir, copying"
		cp \
			--reflink=auto \
			--recursive \
			--no-target-directory \
			--verbose \
			./modules/$mod /
	fi

	if [ -f "/.mod/run" ]
	then
		/.mod/run
	fi
done

