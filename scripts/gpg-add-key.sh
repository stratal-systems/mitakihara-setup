#!/bin/bash

set -e

test -r dep/stratal-systems.gpg
pubkey="$(dep/stratal-systems.gpg)"
cd ~/srv/mitakihara
echo "$pubkey" |
	podman-compose exec minicycle gpg --import

