# Required packages
PRODUCT_PACKAGES += \
    Jelly \
    messaging \
    Turbo

# Extra tools
PRODUCT_PACKAGES += \
    openvpn \
    e2fsck \
    mke2fs \
    tune2fs

# Include librsjni explicitly to workaround GMS issue
PRODUCT_PACKAGES += \
    librsjni
