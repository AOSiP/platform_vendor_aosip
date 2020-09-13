# Required packages
PRODUCT_PACKAGES += \
    Gallery2 \
    Jelly \
    LatinIME \
    messaging \
    ThemePicker \
    Updater
#    AOSiPOverlayStub \

# Extra tools in AOSiP
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    htop \
    lib7z \
    nano \
    pigz \
    powertop \
    unrar \
    unzip \
    vim \
    wget \
    zip
#    libsepol \
#    curl \
#    getcap \
#    setcap \

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
#    librsjni
