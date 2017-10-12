#ifneq ($(filter aosip_device,$(TARGET_PRODUCT)),)
#    PRODUCT_COPY_FILES += \
#        vendor/aosip/prebuilt/common/bootanimation/480.zip:system/media/bootanimation.zip
#endif
ifneq ($(filter aosip_oneplus3,$(TARGET_PRODUCT)),)
    PRODUCT_COPY_FILES += \
        vendor/aosip/prebuilt/common/bootanimation/720.zip:system/media/bootanimation.zip
endif
#ifneq ($(filter aosip_device,$(TARGET_PRODUCT)),)
#    PRODUCT_COPY_FILES += \
#        vendor/aosip/prebuilt/common/bootanimation/1080.zip:system/media/bootanimation.zip
#endif
