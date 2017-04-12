# Copyright (C) 2017 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Inherit device configuration
$(call inherit-product, device/xiaomi/mido/full_mido.mk)

# Inherit some common stuff.
$(call inherit-product, vendor/aosip/config/common_full_phone.mk)

# Product info
TARGET_VENDOR := Xiaomi
PRODUCT_DEVICE := mido
PRODUCT_NAME := aosip_mido
PRODUCT_BRAND := Xiaomi
PRODUCT_MODEL := Redmi Note 4
PRODUCT_MANUFACTURER := Xiaomi

# Device maintainer
PRODUCT_BUILD_PROP_OVERRIDES += DEVICE_MAINTAINERS="Kuba Schenk (aabuk)"

# GSM Client ID
PRODUCT_GMS_CLIENTID_BASE := android-xiaomi

# Build Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT="xiaomi/mido/mido:7.0/NRD90M/7.2.9:user/release-keys" \
    PRIVATE_BUILD_DESC="mido-user 7.0 NRD90M 7.2.9 release-keys"
