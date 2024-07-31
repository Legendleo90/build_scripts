# Removals
rm -rf device/xiaomi/beryllium
rm -rf vendor/aospa
rm -rf vendor/aospa/prebuilt
rm -rf packages/apps/Launcher3
rm -rf frameworks/base
rm -rf packages/apps/Settings

# Initialize repo with specified manifest
repo init -u https://github.com/AOSPA/manifest -b uvite --git-lfs --depth=1

# Clone device tree
git clone https://github.com/Legendleo90/device_xiaomi_beryllium-clo -b uvite device/xiaomi/beryllium

# Sync the repositories
/opt/crave/resync.sh && /opt/crave/resync.sh

# Customs
rm -rf frameworks/base && git clone https://github.com/Oneplus-6T/aospa_fwb -b uvite frameworks/base --depth=1
rm -rf packages/apps/Settings && git clone https://github.com/Oneplus-6T/aospa_Settings -b uvite packages/apps/Settings --depth=1
rm -rf vendor/aospa && git clone https://github.com/Oneplus-6T/aospa_vendor -b uvite vendor/aospa --depth=1
rm -rf vendor/aospa/prebuilt && git clone https://gitlab.com/ThankYouMario/android_vendor_aospa_prebuilt -b uvite vendor/aospa/prebuilt --depth=1
rm -rf packages/apps/Launcher3 && git clone https://github.com/Oneplus-6T/aospa_Launcher3 -b unity packages/apps/Launcher3 --depth=1
rm -rf packages/apps/GameSpace && git clone https://github.com/Oneplus-6T/GameSpace -b fourteen packages/apps/GameSpace --depth=1

# Private Keys
rm -rf ~/.android-certs && git clone https://github.com/Legendleo90/private_keys ~/.android-certs

# Build
./rom-build.sh beryllium -c -t user -s ~/.android-certs
