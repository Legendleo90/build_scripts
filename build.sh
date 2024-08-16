# Removals
rm -rf device/xiaomi/beryllium

# Initialize repo with specified manifest
repo init -u https://github.com/PixelOS-AOSP/manifest.git -b fourteen --git-lfs --depth=1

# Clone device tree
git clone https://github.com/Legendleo90/device_xiaomi_beryllium-4.19 -b fourteen-aosp device/xiaomi/beryllium

# Sync the repositories
/opt/crave/resync.sh

# Private Keys
rm -rf .android-certs && git clone https://github.com/Legendleo90/private_keys .android-certs
cp .android-certs/* vendor/aosp/signing/keys/

# Set up build environment
source build/envsetup.sh

# Lunch configuration
lunch aosp_beryllium-ap2a-eng

# Cleanup directories
make installclean

# Git-lfs
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Build
mka bacon
