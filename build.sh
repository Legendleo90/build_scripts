# Removals
device/xiaomi/beryllium

# Initialize repo with specified manifest
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1

# Clone device tree
git clone https://github.com/Legendleo90/device_xiaomi_beryllium -b rising device/xiaomi/beryllium

# Sync the repositories
/opt/crave/resync.sh

# Cherry-picks
cd frameworks/base && git fetch https://github.com/Legendleo90/android_frameworks_base && git cherry-pick 64b309df6a5a834bbc5bab48b918e5dd8b944016 && cd ../..

# Private Keys
rm -rf vendor/lineage-priv && git clone https://github.com/Legendleo90/vendor_lineage-priv vendor/lineage-priv

# Set up build environment
source build/envsetup.sh

# Lunch configuration
riseup beryllium user

# Cleanup directories
make installclean

# Git-lfs
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Build
rise b
