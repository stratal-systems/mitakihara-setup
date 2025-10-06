#!/bin/bash

if command -v btop
then
	echo "Btop already present, bye!"
	exit 1
fi

set -e
mkdir -p ./depget

arname=btop-x86_64-linux-musl.tbz

if [ -r ./depget/"$arname" ]
then
	echo "Found in depget"
else
	echo "Not found in depget"
	if [ -r ./dep/"$arname" ]
	then
		echo "Found in dep"
		cp --reflink=auto -L "./dep/$arname" "./depget/$arname"
	else
		echo "Not found locally, downloading"
		wget -O ./depget/"$arname" https://github.com/aristocratos/btop/releases/download/v1.4.5/btop-x86_64-linux-musl.tbz
	fi

fi

cd depget
tar xf ./"$arname".tbz
cd btop
./install.sh

