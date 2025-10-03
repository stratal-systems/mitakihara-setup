#!/bin/bash

if ! command -v zstd
then
	echo "zstd not found, leaving fstab as-is!"
	exit 2
fi

backup = /etc/fstab.bak
while [ -f "$backup" ]
do
	backup="${backup}.new"
done

cp /etc/fstab "$backup"

sed -i 's|/ btrfs defaults|/ btrfs noatime,lazytime,compress=zstd:7,ssd,discard=async,space_cache=v2,autodefrag|' /etc/fstab


