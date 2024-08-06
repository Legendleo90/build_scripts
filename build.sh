# Removals
rm -rf device/xiaomi/beryllium
rm -rf vendor/aospa
rm -rf packages/apps/Launcher3
rm -rf frameworks/base
rm -rf frameworks/av
rm -rf packages/apps/Settings
rm -rf packages/apps/Paranoid/SystemUI
rm -rf prebuilts
rm -rf external

# Initialize repo with specified manifest
repo init -u https://github.com/AOSPA/manifest -b uvite --git-lfs --depth=1

# Clone device tree
git clone https://github.com/Legendleo90/device_xiaomi_beryllium-clo -b uvite device/xiaomi/beryllium

# Sync the repositories
/opt/crave/resync.sh && /opt/crave/resync.sh

# Customs
rm -rf frameworks/base && git clone https://github.com/Oneplus-6T/aospa_fwb -b uvite frameworks/base --depth=1
rm -rf frameworks/av && git clone https://github.com/Oneplus-6T/aospa_av -b uvite frameworks/av --depth=1
rm -rf packages/apps/Settings && git clone https://github.com/Oneplus-6T/aospa_Settings -b uvite packages/apps/Settings --depth=1
rm -rf packages/apps/Paranoid/SystemUI && git clone https://github.com/Oneplus-6T/aospa_SystemUI -b uvite packages/apps/Paranoid/SystemUI --depth=1
rm -rf vendor/aospa && git clone https://github.com/Oneplus-6T/aospa_vendor -b uvite vendor/aospa --depth=1
git clone https://gitlab.com/ThankYouMario/android_vendor_aospa_prebuilt -b uvite vendor/aospa/prebuilt --depth=1
git clone https://github.com/AOSPA/vendor_aospa_apps_ParanoidThemePicker -b uvite vendor/aospa/apps/ParanoidThemePicker --depth=1
git clone https://github.com/AOSPA/android_vendor_aospa_translations -b uvite vendor/aospa/translations --depth=1
rm -rf packages/apps/Launcher3 && git clone https://github.com/Oneplus-6T/aospa_Launcher3 -b unity packages/apps/Launcher3 --depth=1
rm -rf packages/apps/GameSpace && git clone https://github.com/Oneplus-6T/GameSpace -b fourteen packages/apps/GameSpace --depth=1

# Private Keys
rm -rf ~/.android-certs && git clone https://github.com/Legendleo90/private_keys ~/.android-certs

# Set up build environment
source build/envsetup.sh

# Cleanup directories
make installclean

# Build
./rom-build.sh beryllium -t user -s ~/.android-certs
