# Required packages
PRODUCT_PACKAGES += \
    Gallery2 \
    LatinIME \
    Launcher3 \
    LiveWallpapers \
    LiveWallpapersPicker \
    messaging \
    TurboPrebuilt \
    turbo.xml \
    WeatherClient \
    WellbeingPrebuilt \
    Updater

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni
