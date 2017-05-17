#
# Copyright (C) 2014 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from vendor
$(call inherit-product, vendor/aosip/config/common_full_phone.mk)

# Inherit from device tree
$(call inherit-product, device/huawei/kiwi/device.mk)

# Device identifier. This must come after all inclusions
PRODUCT_DEVICE := kiwi
PRODUCT_NAME := aosip_kiwi
PRODUCT_BRAND := HONOR
PRODUCT_MODEL := KIW-L24
PRODUCT_MANUFACTURER := HUAWEI

# GSM Client ID Base
PRODUCT_GMS_CLIENTID_BASE := android-huawei

# Device maintainer(s)
PRODUCT_BUILD_PROP_OVERRIDES += DEVICE_MAINTAINERS="Michael S Corigliano (Mike Criggs)"

# Use the latest approved GMS identifiers unless running a signed build
PRODUCT_BUILD_PROP_OVERRIDES += \
    BUILD_FINGERPRINT=huawei/kiwi/5x:7.1.1/MHC19Q/ZNH2KAS1KN:user/release-keys \
    PRIVATE_BUILD_DESC="kiwi-user 7.1.1 MHC19Q ZNH2KAS1KN release-keys"
