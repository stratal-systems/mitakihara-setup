#!/bin/sh

set -e

git pull origin
git annex sync --no-push origin
git annex get .

./scritps/mod-apply.sh maybetree-compose
./scritps/mod-apply.sh maybetree-compose-secret
sudo ./scritps/mod-apply.sh root-compose
sudo ./scritps/mod-apply.sh root-compose-secret

