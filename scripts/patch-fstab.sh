#!/bin/sh

sed -i /etf/fstab 's|/ btrfs defaults|/ btrfs rw,noatime,lazytime,compress=zstd:12,ssd,discard=async,space_cache=v2,autodefrag,subvolid=5,subvol=/|'


