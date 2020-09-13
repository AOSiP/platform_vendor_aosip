PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    dalvik.vm.debug.alloc=0 \
    keyguard.no_require_sim=true \
    media.recorder.show_manufacturer_and_model=true \
    net.tethering.noprovisioning=true \
    persist.sys.disable_rescue=true \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.carrier=unknown \
    ro.com.android.dataroaming=false \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.config.bt_sco_vol_steps=30 \
    ro.config.media_vol_steps=30 \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.storage_manager.enabled=true \
    ro.com.google.ime.bs_theme=true \
    ro.com.google.ime.theme_id=5 \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html

# Extra packages
PRODUCT_PACKAGES += \
    libjni_latinimegoogle

ifeq ($(PRODUCT_GMS_CLIENTID_BASE),)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=android-google
else
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.google.clientidbase=$(PRODUCT_GMS_CLIENTID_BASE)
endif

PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/aosip/prebuilt/common/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/aosip/prebuilt/common/bin/50-base.sh:$(TARGET_COPY_OUT_SYSTEM)/addon.d/50-base.sh

ifneq ($(AB_OTA_PARTITIONS),)
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/bin/backuptool_ab.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.sh \
    vendor/aosip/prebuilt/common/bin/backuptool_ab.functions:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_ab.functions \
    vendor/aosip/prebuilt/common/bin/backuptool_postinstall.sh:$(TARGET_COPY_OUT_SYSTEM)/bin/backuptool_postinstall.sh
ifneq ($(TARGET_BUILD_VARIANT),user)
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.ota.allow_downgrade=true
endif
endif

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/aosip/config/backup.xml:system/etc/sysconfig/backup.xml

# Charger
PRODUCT_PACKAGES += \
    charger_res_images

# Configs
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/etc/sysconfig/dialer_experience.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/dialer_experience.xml \
    vendor/aosip/prebuilt/common/etc/sysconfig/turbo.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/sysconfig/turbo.xml

# Copy all AOSiP-specific init rc files
$(foreach f,$(wildcard vendor/aosip/prebuilt/common/etc/init/*.rc),\
	$(eval PRODUCT_COPY_FILES += $(f):$(TARGET_COPY_OUT_SYSTEM)/etc/init/$(notdir $f)))

# Dex preopt
PRODUCT_DEXPREOPT_SPEED_APPS += \
    SystemUI \
    Launcher3QuickStep

# Don't include art debug targets
PRODUCT_ART_TARGET_INCLUDE_DEBUG_BUILD := false

# Strip the local variable table and the local variable type table to reduce
# the size of the system image. This has no bearing on stack traces, but will
# leave less information available via JDWP.
PRODUCT_MINIMIZE_JAVA_DEBUG_INFO := true

# Disable vendor restrictions
PRODUCT_RESTRICT_VENDOR_FILES := false

PRODUCT_ARTIFACT_PATH_REQUIREMENT_ALLOWED_LIST += \
    system/addon.d/50-base.sh \
    system/bin/curl \
    system/bin/getcap \
    system/bin/setcap \
    system/etc/init/aosip-adb.rc \
    system/etc/init/aosip-iosched.rc \
    system/etc/init/aosip-radio.rc \
    system/etc/init/aosip-ssh.rc \
    system/etc/init/aosip-system.rc \
    system/etc/init/aosip-updates.rc \
    system/etc/selective-spn-conf.xml \
    system/etc/sensitive_pn.xml \
    system/etc/spn-conf.xml \
    system/etc/sysconfig/backup.xml \
    system/etc/sysconfig/dialer_experience.xml \
    system/etc/sysconfig/turbo.xml \
    system/lib/libRSSupport.so \
    system/lib/libblasV8.so \
    system/lib/librsjni.so \
    system/lib/libsepol.so \
    system/lib64/libRSSupport.so \
    system/lib64/libblasV8.so \
    system/lib64/librsjni.so \
    system/lib64/libsepol.so \
    system/bin/fsck.exfat \
system/bin/fsck.ntfs \
system/bin/mkfs.exfat \
system/bin/mkfs.ntfs \
system/bin/mount.ntfs \
system/etc/bash/bash_logout \
system/etc/bash/bashrc \
system/etc/bash/inputrc \
system/etc/vimrc \
system/lib/lib7z.so \
system/lib64/lib7z.so \
system/lib64/libfuse-lite.so \
system/lib64/libncurses.so \
system/lib64/libntfs-3g.so \
system/usr/share/vim/autoload/dist/ft.vim \
system/usr/share/vim/autoload/spacehi.vim \
system/usr/share/vim/colors/default.vim \
system/usr/share/vim/colors/desert.vim \
system/usr/share/vim/doc/editing.txt \
system/usr/share/vim/doc/help.txt \
system/usr/share/vim/doc/intro.txt \
system/usr/share/vim/doc/motion.txt \
system/usr/share/vim/doc/options.txt \
system/usr/share/vim/doc/scroll.txt \
system/usr/share/vim/doc/tags \
system/usr/share/vim/doc/term.txt \
system/usr/share/vim/doc/version8.txt \
system/usr/share/vim/filetype.vim \
system/usr/share/vim/ftoff.vim \
system/usr/share/vim/indent.vim \
system/usr/share/vim/indoff.vim \
system/usr/share/vim/plugin/matchparen.vim \
system/usr/share/vim/scripts.vim \
system/usr/share/vim/syntax/awk.vim \
system/usr/share/vim/syntax/c.vim \
system/usr/share/vim/syntax/conf.vim \
system/usr/share/vim/syntax/config.vim \
system/usr/share/vim/syntax/context.vim \
system/usr/share/vim/syntax/cpp.vim \
system/usr/share/vim/syntax/css.vim \
system/usr/share/vim/syntax/diff.vim \
system/usr/share/vim/syntax/doxygen.vim \
system/usr/share/vim/syntax/dtd.vim \
system/usr/share/vim/syntax/gitcommit.vim \
system/usr/share/vim/syntax/help.vim \
system/usr/share/vim/syntax/html.vim \
system/usr/share/vim/syntax/java.vim \
system/usr/share/vim/syntax/javascript.vim \
system/usr/share/vim/syntax/logcat.vim \
system/usr/share/vim/syntax/lua.vim \
system/usr/share/vim/syntax/manual.vim \
system/usr/share/vim/syntax/markdown.vim \
system/usr/share/vim/syntax/pod.vim \
system/usr/share/vim/syntax/sh.vim \
system/usr/share/vim/syntax/syncolor.vim \
system/usr/share/vim/syntax/synload.vim \
system/usr/share/vim/syntax/syntax.vim \
system/usr/share/vim/syntax/vb.vim \
system/usr/share/vim/syntax/vim.vim \
system/usr/share/vim/syntax/xml.vim \
system/xbin/7z \
system/xbin/bash \
system/xbin/htop \
system/xbin/pigz \
system/xbin/unrar \
system/xbin/vim \
system/xbin/zip


# Overlays
include vendor/overlay/overlays.mk

# Packages
include vendor/aosip/config/packages.mk

# Versioning
include vendor/aosip/config/version.mk
