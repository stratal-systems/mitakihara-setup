#!/bin/bash

echo "Killing snap!"

if [ "$(id -u)" != 0 ]
then
	echo "Run as root please!"
	exit 1
fi

systemctl stop snapd
systemctl disable snapd
systemctl mask snapd

apt purge snapd -y
apt-mark hold snapd

preffile="/etc/apt/preferences.d/killsnap.pref"
echo -e "Package: snapd\nPin: release a=*\nPin-Priority: -10" > "$preffile"
chattr +i "$preffile"

killpaths="/usr/bin/snap /usr/bin/snapctl /usr/bin/snapfuse /lib/systemd/system/snapd.socket /snap /root/snap /var/snap /var/lib/snapd $(ls -d /home/*/snap)"

for opath in $killpaths
do
	if [ -f "$opath" ]
	then
		shred "$opath"
	elif [ -d "$opath" ]
	then
		find -type f "$opath" -exec shred "{}" \;
	fi

	rm -rf "$opath"

	mkdir -p "$(dirname "$path")"
	echo "DIE DIE DIE" > "$path"
	chmod 444 "$path"
	chattr +i "$path"
done

