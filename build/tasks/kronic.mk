AOSIP_TARGET_PACKAGE := $(PRODUCT_OUT)/AOSiP-$(AOSIP_VERSION).zip

.PHONY: otapackage kronic bacon
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
kronic: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(AOSIP_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(AOSIP_TARGET_PACKAGE) | cut -d ' ' -f1 > $(AOSIP_TARGET_PACKAGE).md5sum
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}AOSiP ${txtrst}";
	@echo -e ""
	@echo -e ${CL_GRN}"            ▄▄▄·       .▄▄ · ▪   ▄▄▄·          "
	@echo -e ${CL_GRN}"           ▐█ ▀█ ▪     ▐█ ▀. ██ ▐█ ▄█          "
	@echo -e ${CL_GRN}"           ▄█▀▀█  ▄█▀▄ ▄▀▀▀█▄▐█· ██▀·          "
	@echo -e ${CL_GRN}"           ▐█ ▪▐▌▐█▌.▐▌▐█▄▪▐█▐█▌▐█▪·•          "
	@echo -e ${CL_GRN}"            ▀  ▀  ▀█▄▀▪ ▀▀▀▀ ▀▀▀.▀             "
	@echo -e ""
	@echo -e "Zip: "$(AOSIP_TARGET_PACKAGE)
	@echo -e "MD5: $$(cat $(AOSIP_TARGET_PACKAGE).md5sum | awk '{print $1}')"
	@echo -e "Size: $$(du -sh $(AOSIP_TARGET_PACKAGE))"
	@echo -e ""

bacon: kronic
