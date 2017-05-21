# Device tree for honami for AOSiP

# Inherit AOSP Rhine device parts
$(call inherit-product, device/sony/honami/aosp_c6903.mk)

# Inherit Lineage Rhine device parts
$(call inherit-product, device/sony/rhine-common/platform2.mk)

#Inherit Stuff from Vendor
$(call inherit-product, vendor/aosip/config/common_full_phone.mk)

# Dalvik/HWUI
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-dalvik-heap.mk)
$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-2048-hwui-memory.mk)

PRODUCT_NAME := aosip_honami
PRODUCT_DEVICE := honami
PRODUCT_MODEL := Xperia Z1
PRODUCT_BRAND := Sony
PRODUCT_MANUFACTURER := Sony

# Fingerprint for honami (from stock)
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=C6903
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_FINGERPRINT=Sony/C6903/C6903:5.1.1/14.6.A.1.236/2031203603:user/release-keys
PRODUCT_BUILD_PROP_OVERRIDES += PRIVATE_BUILD_DESC="C6903-user 5.1.1 14.6.A.1.236 2031203603 release-keys"

PRODUCT_BUILD_PROP_OVERRIDES += DEVICE_MAINTAINERS="Akash Srivastava (markakash)"
