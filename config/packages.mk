# Required packages
PRODUCT_PACKAGES += \
    Gallery2 \
    Jelly \
    Launcher3 \
    LiveWallpapers \
    LiveWallpapersPicker \
    messaging \
    Turbo

ifeq ($(AOSIP_BUILDTYPE), Official)
    PRODUCT_PACKAGES += \
        Updater
endif

# Accents
PRODUCT_PACKAGES += \
    AmberAccent \
    BlackAccent \
    BlueAccent \
    BlueGreyAccent \
    BrownAccent \
    CyanAccent \
    DeepOrangeAccent \
    DeepPurpleAccent \
    GreenAccent \
    GreyAccent \
    IndigoAccent \
    LightBlueAccent \
    LightGreenAccent \
    LimeAccent \
    OrangeAccent \
    PinkAccent \
    PurpleAccent \
    RedAccent \
    TealAccent \
    YellowAccent \
    WhiteAccent

# Dark Theme
PRODUCT_PACKAGES += \
    DuiDark \
    GBoardDark \
    SettingsDark \
    SystemDark \
    UpdaterDark

# BlackAF Theme
PRODUCT_PACKAGES += \
    DuiBlackAF \
    GBoardBlackAF \
    SettingsBlackAF \
    SystemBlackAF \
    UpdaterBlackAF

# Analog clocks
PRODUCT_PACKAGES += \
    AnalogDeadpool \
    AnalogDeepNight

# Extra tools
PRODUCT_PACKAGES += \
    7z \
    awk \
    bash \
    bzip2 \
    curl \
    e2fsck \
    fsck.ntfs \
    gdbserver \
    htop \
    lib7z \
    libsepol \
    micro_bench \
    mke2fs \
    mkfs.ntfs \
    mount.ntfs \
    openvpn \
    oprofiled \
    pigz \
    powertop \
    sqlite3 \
    strace \
    tune2fs \
    unrar \
    unzip \
    vim \
    wget \
    zip

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

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils
