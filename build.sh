# Removals
rm -rf .repo/local_manifests

# Initialize repo with specified manifest
repo init -u https://github.com/RisingTechOSS/android -b fourteen --git-lfs --depth=1 

# Clone local_manifests repository
git clone https://github.com/Legendleo90/local_manifests --depth 1 -b rising .repo/local_manifests 

# Sync the repositories
/opt/crave/resync.sh

# KSU
cd kernel/xiaomi/beryllium && curl -LSs "https://raw.githubusercontent.com/tiann/KernelSU/main/kernel/setup.sh" | bash - && cd ../../..

# Clone Private Keys
git clone https://github.com/Legendleo90/private_keys.git -b main vendor/rising/signing/keys

# Set up build environment
source build/envsetup.sh

# Lunch configuration
riseup beryllium user
make installclean

# Build
croot
repo forall -c 'git lfs install && git lfs pull && git lfs checkout' 
rise sb
