# Removals
rm -rf device/xiaomi/beryllium

# Initialize repo with specified manifest
repo init --depth=1 --no-repo-verify --git-lfs -u https://github.com/ProjectInfinity-X/manifest -b QPR3 -g default,-mips,-darwin,-notdefault

# Clone device tree
git clone https://github.com/Legendleo90/device_xiaomi_beryllium-4.19 -b fourteen device/xiaomi/beryllium

# Sync the repositories
/opt/crave/resync.sh && /opt/crave/resync.sh

# Private Keys
rm -rf vendor/infinity-priv && git clone https://github.com/Legendleo90/vendor_lineage-priv -b infinity vendor/infinity-priv

# Set up build environment
source build/envsetup.sh

# Lunch configuration
lunch infinity_beryllium-user

# Cleanup directories
make installclean

# Git-lfs
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Build
mka bacon
