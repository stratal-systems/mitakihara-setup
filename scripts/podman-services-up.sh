#!/bin/sh

systemctl unmask podman
systemctl enable podman
systemctl start podman
systemctl unmask podman-compose-root
systemctl enable podman-compose-root
systemctl start podman-compose-root

