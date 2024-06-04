# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1

# Clone local_manifests repository
git clone https://github.com/Legendleo90/local_manifests --depth 1 -b rising .repo/local_manifests

# Sync the repositories
if [ -f /opt/crave/resync.sh ]; then
  /opt/crave/resync.sh
else
  repo sync -c --no-clone-bundle --optimized-fetch --prune --force-sync -j$(nproc --all)
fi

# Custom Repos
rm -rf build/make && git clone https://github.com/RisingOS-staging/android_build build/make --depth=1
rm -rf vendor/rising && git clone https://github.com/RisingOS-staging/android_vendor_rising vendor/rising --depth=1

# Private Keys
rm -rf vendor/lineage-priv && git clone https://github.com/Legendleo90/vendor_lineage-priv vendor/lineage-priv

# Set up build environment
source build/envsetup.sh

# Lunch configuration
riseup beryllium user
make installclean

# Build
croot
repo forall -c 'git lfs install && git lfs pull && git lfs checkout'
rise b
