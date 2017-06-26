#!/bin/bash -x

cd $(dirname $0)

cp -r /var/cache/pacman/pkg ./airootfs/root/packages
cp packages.both ./airootfs/root/packages/

mkdir -p ./airootfs/root/rootfs-private

sudo rm -rf ./work
sudo ./build.sh -v
