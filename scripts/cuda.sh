#!/bin/bash

set -e

mkdir -p ./depget

if ! [ -f ./depget/cuda-ubuntu2004.pin ]
then
	echo "cuda-ubuntu2004.pin not found"
	if [ -r "./dep/cuda-ubuntu2004.pin" ]
	then
		echo "cuda-ubuntu2004.pin in annex"
		cp -L ./dep/cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
	else
		echo "cuda-ubuntu2004.pin not in annex, downloading..."
		wget -O ./depget/cuda-ubuntu2004.pin https://developer.download.nvidia.com/compute/cuda/repos/ubuntu2004/x86_64/cuda-ubuntu2004.pin
	fi
else
fi

if ! [ -f ./depget/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb ]
then
	echo "cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb not found"
	if [ -r "./dep/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb" ]
	then
		echo "cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb in annex"
		cp -L ./dep/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb /etc/apt/preferences.d/cuda-repository-pin-600
	else
		echo "cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb not in annex, downloading..."
		wget -O ./depget/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb http://developer.download.nvidia.com/compute/cuda/11.0.2/local_installers/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb
	fi
fi

cp -L ./depget/cuda-ubuntu2004.pin /etc/apt/preferences.d/cuda-repository-pin-600
dpkg -i ./depget/cuda-repo-ubuntu2004-11-0-local_11.0.2-450.51.05-1_amd64.deb
apt-key add /var/cuda-repo-ubuntu2004-11-0-local/7fa2af80.pub
apt-get update
apt-get -y install cuda

