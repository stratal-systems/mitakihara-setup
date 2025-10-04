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
	rm -rf ./tmp
	mkdir -p ./tmp

	if [ -f "./modules/${mod}.tar.zst" ]
	then
		echo "$mod is a file, unpacking"

		tar xf "./modules/${mod}.tar.zst" --directory ./tmp
		copy_from="./tmp"
	elif [ -d "./modules/$mod" ]
	then
		echo "$mod is dir"

		copy_from="./modules/$mod"
	fi

	user_wanted="$(cat "$copy_from"/.mod/user | head -n 1 | tr -d '\n')"
	if [ "$user_wanted" != "$(whoami)" ]
	then
		echo "User doesnt match, abort!"
		exit 10
	fi

	cp \
		--reflink=auto \
		--recursive \
		--no-target-directory \
		--verbose \
		"$copy_from" /

	if [ -f "/.mod/run" ]
	then
		/.mod/run
	fi
done

