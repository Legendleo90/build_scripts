# Removals
rm -rf .repo/local_manifests
rm -rf vendor/everest-priv

# Initialize repo with specified manifest
repo init -u https://github.com/ProjectEverest/manifest -b qpr3 --git-lfs --depth=1

# Clone local_manifests repository
git clone https://github.com/Legendleo90/local_manifests --depth 1 -b everest .repo/local_manifests

# Sync the repositories
/opt/crave/resync.sh

# Private Keys
git clone https://github.com/Legendleo90/vendor_lineage-priv -b everest vendor/everest-priv

# Set up build environment
source build/envsetup.sh

# Lunch configuration
lunch everest_beryllium-user

# Cleanup directories
make installclean

# Git-lfs
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'

# Build
make bacon
