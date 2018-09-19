ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/aosip/config/BoardConfigQcom.mk
endif

include vendor/aosip/config/BoardConfigKernel.mk
include vendor/aosip/config/BoardConfigSoong.mk
