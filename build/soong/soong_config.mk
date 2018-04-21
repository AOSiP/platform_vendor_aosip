# Insert new variables inside the Aosip structure
aosip_soong:
	$(hide) mkdir -p $(dir $@)
	$(hide) (\
	echo '{'; \
	echo '"Aosip": {'; \
	echo '    "Uses_generic_camera_parameter_library": $(if $(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY),false,true),'; \
	echo '    "Specific_camera_parameter_library": "$(TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY)",'; \
	echo '    "Needs_text_relocations": $(if $(filter true,$(TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS)),true,false),'; \
	echo '    "Qcom_bsp_legacy":  $(if $(filter msm7x27a msm7x30 msm8660 msm8960,$(TARGET_BOARD_PLATFORM)),true,false),'; \
	echo '    "BoardUsesQTIHardware":  $(if $(BOARD_USES_QTI_HARDWARE),true,false),'; \
	echo '    "Uses_qcom_bsp_legacy": $(if $(filter true,$(TARGET_USES_QCOM_BSP_LEGACY)),true,false),'; \
	echo '    "Uses_qti_camera_device": $(if $(filter true,$(TARGET_USES_QTI_CAMERA_DEVICE)),true,false),'; \
	echo '    "Target_shim_libs": "$(subst $(space),:,$(TARGET_LD_SHIM_LIBS))"'; \
	echo '},'; \
	echo '') > $(SOONG_VARIABLES_TMP)
