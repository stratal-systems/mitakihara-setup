#!/bin/sh

systemctl --user unmask podman
systemctl --user enable podman
systemctl --user start podman

