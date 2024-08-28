# Removals
rm -rf device/xiaomi/beryllium
rm -rf frameworks/native

# Initialize repo with specified manifest
repo init -u https://github.com/ProjectEverest/manifest -b 14 --git-lfs --depth=1

# Clone device tree
git clone https://github.com/ProjectEverest-Devices/android_device_xiaomi_beryllium -b 14 device/xiaomi/beryllium

# Sync the repositories
/opt/crave/resync.sh && /opt/crave/resync.sh

# Private Keys
rm -rf .android-certs && git clone https://github.com/Legendleo90/private_keys .android-certs
cp .android-certs/* vendor/lineage/signing/keys/

# Set up build environment
source build/envsetup.sh

# Lunch configuration
lunch lineage_beryllium-user

# Cleanup directories
make installclean

# Git-lfs
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Build
mka everest
