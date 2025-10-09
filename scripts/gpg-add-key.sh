#!/bin/bash

set -e

cd ~/srv/mitakihara
test -r dep/stratal-systems.gpg
cat dep/stratal-systems.gpg |
	podman-compose exec minicycle gpg --import

