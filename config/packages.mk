# Required packages
PRODUCT_PACKAGES += \
    Gallery2 \
    LatinIME \
    messaging \
    ThemePicker \
    AOSiPOverlayStub \
    Updater

# Extra tools in AOSiP
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    getcap \
    htop \
    lib7z \
    libsepol \
    nano \
    pigz \
    powertop \
    setcap \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Faceunlock
TARGET_ENABLE_FACE_SENSE ?= true
ifeq ($(TARGET_ENABLE_FACE_SENSE), true)
PRODUCT_PACKAGES += \
    ParanoidFaceSense
DEVICE_PACKAGE_OVERLAYS += vendor/overlay/faceunlock
endif
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.face.sense_service=$(TARGET_ENABLE_FACE_SENSE)

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
