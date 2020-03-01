# APEX
ifneq ($(filter Alpha Beta CI Official,$(AOSIP_BUILDTYPE)),)
    TARGET_FLATTEN_APEX := true
endif

include vendor/aosip/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/aosip/config/BoardConfigQcom.mk
endif

include vendor/aosip/config/BoardConfigSoong.mk
