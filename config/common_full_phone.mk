# Inherit common aosip stuff
$(call inherit-product, vendor/aosip/config/common.mk)

$(call inherit-product, vendor/aosip/config/telephony.mk)

$(call inherit-product, vendor/aosip/config/aosip_props.mk)
