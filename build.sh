# Removals
rm -rf device/xiaomi/beryllium

# Initialize repo with specified manifest
repo init -u https://github.com/RisingTechOSS/android -b fifteen --git-lfs --depth=1

# Clone device tree
git clone https://github.com/Legendleo90/device_xiaomi_beryllium -b rising device/xiaomi/beryllium

# Sync the repositories
/opt/crave/resync.sh && /opt/crave/resync.sh

# Private Keys
rm -rf vendor/lineage-priv && git clone https://github.com/Legendleo90/vendor_lineage-priv vendor/lineage-priv

# Set up build environment
source build/envsetup.sh

# Lunch configuration
riseup beryllium user

# Git-lfs
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Build
rise b
