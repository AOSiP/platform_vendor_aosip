# Required packages
PRODUCT_PACKAGES += \
    Gallery2 \
    Launcher3 \
    LiveWallpapers \
    LiveWallpapersPicker \
    messaging \
    Turbo

#ifeq ($(AOSIP_BUILDTYPE), Official)
#    PRODUCT_PACKAGES += \
#        Updater
#endif

# Extra tools
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    e2fsck \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    openvpn \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    unrar \
    unzip \
    vim \
    wget \
    zip

# Filesystems tools
PRODUCT_PACKAGES += \
    fsck.exfat \
    fsck.ntfs \
    mke2fs \
    mkfs.exfat \
    mkfs.ntfs \
    mount.ntfs

# Openssh
PRODUCT_PACKAGES += \
    scp \
    sftp \
    ssh \
    sshd \
    sshd_config \
    ssh-keygen \
    start-ssh

# rsync
PRODUCT_PACKAGES += \
    rsync

# Include explicitly to work around GMS issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full \
    librsjni
