#!/bin/bash

#sync
repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen --git-lfs --depth=1
git clone https://github.com/Legendleo90/local_manifests.git -b pos .repo/local_manifests
repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all)

# build
. build/envsetup.sh
lunch aosp_beryllium-ap1a-user
make bacon
