#!/bin/bash

set -e

where=/srv/mitakihara

if ! [ -r dep/stratal-systems.gpg ]
then
	echo "Key not found under ./dep, bye!"
	exit 1
fi

pubkey="$(cat dep/stratal-systems.gpg)"
cd "$where"
sudo podman-compose exec -T minicycle mkdir -p /root/.gnupg
sudo podman-compose exec -T minicycle chmod 700 /root/.gnupg
echo "$pubkey" |
	sudo podman-compose exec -T minicycle gpg --import

