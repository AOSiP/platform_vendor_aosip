# Inherit common AOSiP stuff
$(call inherit-product, vendor/aosip/config/common.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

# Include AOSiP LatinIME dictionaries
PRODUCT_PACKAGE_OVERLAYS += vendor/aosip/overlay/dictionaries
