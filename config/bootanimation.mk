ifeq ($(AOSIP_BUILD), mata)
PRODUCT_COPY_FILES += \
    vendor/aosip/prebuilt/common/bootanimation/bootanimation1312.zip:system/media/bootanimation.zip
else
    vendor/aosip/prebuilt/common/bootanimation/bootanimation.zip:system/media/bootanimation.zip
endif
