#!/bin/bash

set -e

test -r dep/stratal-systems.gpg
pubkey="$(cat dep/stratal-systems.gpg)"
cd ~/srv/mitakihara
podman-compose exec -T minicycle mkdir /root/.gnupg
podman-compose exec -T minicycle chmod 700 /root/.gnupg
echo "$pubkey" |
	podman-compose exec -T minicycle gpg --import

