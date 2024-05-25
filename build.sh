#!/bin/bash

#removals
rm -rf .repo/local_manifests
rm -rf vendor/gms
rm -rf .repo/projects/vendor/gms.git
rm -rf .repo/project-objects/*/android_vendor_gms.git

#git-lfs
sudo apt install git-lfs -y
git lfs install

#sync
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1
git clone https://github.com/Legendleo90/local_manifests.git -b rising .repo/local_manifests
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

#ksu
cd kernel/xiaomi/beryllium && curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash - && cd ../../..

# build
. build/envsetup.sh
riseup beryllium user
make installclean
rise b
