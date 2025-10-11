#!/bin/sh

set -e

git pull origin
git annex sync --no-push origin
git annex get .

./scripts/mod-apply.sh maybetree-compose
./scripts/mod-apply.sh maybetree-compose-secret
sudo ./scripts/mod-apply.sh root-compose
sudo ./scripts/mod-apply.sh root-compose-secret
(
	cd /srv/mitakihara
	sudo ./scripts/tailscale-register.sh
	)

