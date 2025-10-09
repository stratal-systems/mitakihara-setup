#!/bin/bash

set -e

test -r dep/stratal-systems.gpg
pubkey="$(cat dep/stratal-systems.gpg)"
cd ~/srv/mitakihara
echo "$pubkey" |
	podman-compose exec -ti minicycle gpg --import

