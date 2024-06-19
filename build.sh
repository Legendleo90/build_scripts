# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1

# Clone local_manifests repository
git clone https://github.com/Legendleo90/local_manifests --depth 1 -b rising .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

# Custom Repos
rm -rf frameworks/base && git clone https://github.com/Legendleo90/rising_fwb frameworks/base --depth=1

# Private Keys
rm -rf vendor/lineage-priv && git clone https://github.com/Legendleo90/vendor_lineage-priv vendor/lineage-priv

# Set up build environment
source build/envsetup.sh

# Lunch configuration
riseup beryllium user

# Cleanup directories
# make installclean

# Git-lfs
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Build
rise b
