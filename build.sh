# Removals
rm -rf .repo/local_manifests
rm -rf vendor/evolution-priv

# Initialize repo with specified manifest
repo init -u https://github.com/Evolution-XYZ/manifest -b udc --git-lfs --depth=1

# Clone local_manifests repository
git clone https://github.com/Legendleo90/local_manifests --depth 1 -b los .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

# Cherry-Picks
cd f*/b* && git fetch https://github.com/Legendleo90/android_frameworks_base && git cherry-pick 64b309df6a5a834bbc5bab48b918e5dd8b944016 && cd ../..

# Private Keys
git clone https://github.com/Legendleo90/vendor_lineage-priv -b los vendor/evolution-priv

# Set up build environment
source build/envsetup.sh

# Lunch configuration
lunch lineage_beryllium-user

# Cleanup directories
# make installclean

# Git-lfs
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Build
m evolution
