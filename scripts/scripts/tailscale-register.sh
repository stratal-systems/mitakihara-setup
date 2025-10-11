#!/bin/sh

podman-compose exec -ti tailscale \
	tailscale up --login-server https://hs.stratal.systems:8080

