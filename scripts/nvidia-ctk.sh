#!/bin/sh

# https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html

if command -v nvidia-ctk
then
	echo "nvidia-ctk command present, bye!"
	exit 2
fi

curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey |
	gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg \
	&& curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list | \
	sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' | \
	sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list

apt update
apt install \
	libnvidia-container-tools \
	nvidia-container-toolkit \
	nvidia-container-toolkit-base

