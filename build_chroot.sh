#!/bin/bash
#This file is the install instruction for the CHROOT build
#We're using cloudsmith-cli to upload the file in CHROOT

sudo apt-get install -y git device-tree-compiler libncurses5 libncurses5-dev build-essential libssl-dev mtools bc python-is-python3 dosfstools bison flex rsync u-boot-tools make
sudo apt install -y python3-pip
sudo pip3 install --upgrade cloudsmith-cli
ls -a
mkdir ~/rk3588-sdk && cd ~/rk3588-sdk
git clone -b dev-rkr3.4 https://github.com/ArduCAM/RK_Kernel.git kernel
git clone -b master https://github.com/radxa/rkbin.git
git clone -b debian https://github.com/radxa/build.git
cd ~/rk3588-sdk
sudo ./build/mk-kernel.sh rk3588-rock-5b

mkdir -p /opt/out/
cp -v out/*.dep /opt/out/
echo "copied deb file"
echo "push to cloudsmith"
git describe --exact-match HEAD >/dev/null 2>&1
echo "Pushing the package to OpenHD 2.3 repository"
ls -a
API_KEY=$(cat cloudsmith_api_key.txt)
DISTRO=$(cat distro.txt)
FLAVOR=$(cat flavor.txt)
cloudsmith push deb --api-key "$API_KEY" openhd/openhd-2-3-evo/${DISTRO}/${FLAVOR} *.deb || exit 1

