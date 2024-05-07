#!/bin/bash

#removals
rm -rf .repo/local_manifests

#sync
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1
git clone https://github.com/Legendleo90/local_manifests.git -b rising .repo/local_manifests
repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)

#ksu
cd kernel/xiaomi/beryllium && curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash - && cd ../../..

# build
/opt/crave/resync.sh
. build/envsetup.sh
riseup beryllium user
rise b
