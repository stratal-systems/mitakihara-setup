#!/bin/bash

# Thanks
# https://www.atlantic.net/dedicated-server-hosting/how-to-install-and-use-podman-on-ubuntu/

if ! command -v podman
then
	echo "Podman command not found, installing..."

	set -e

	apt-get install curl wget gnupg2 -y

	source /etc/os-release
	sh -c "echo 'deb http://download.opensuse.org/repositories/devel:/kubic:/libcontainers:/stable/xUbuntu_${VERSION_ID}/ /' > /etc/apt/sources.list.d/devel:kubic:libcontainers:stable.list"

	wget -nv https://download.opensuse.org/repositories/devel:kubic:libcontainers:stable/xUbuntu_${VERSION_ID}/Release.key -O- | apt-key add -

	apt-get update -qq -y
	apt-get -qq --yes install podman

	set +e
else
	echo "podman command found, skipping install"
fi

