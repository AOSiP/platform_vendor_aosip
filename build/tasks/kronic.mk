AOSIP_TARGET_PACKAGE := $(PRODUCT_OUT)/AOSiP-$(AOSIP_VERSION).zip

MD5 := prebuilts/build-tools/path/$(HOST_OS)-x86/md5sum

.PHONY: kronic bacon
kronic: otapackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(AOSIP_TARGET_PACKAGE)
	$(hide) $(MD5) $(AOSIP_TARGET_PACKAGE) | cut -d ' ' -f1 > $(AOSIP_TARGET_PACKAGE).md5sum
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}AOSiP ${txtrst}";
	@echo -e ""
	@echo -e ${CL_GRN}"            ▄▄▄·       .▄▄ · ▪   ▄▄▄·          "
	@echo -e ${CL_GRN}"           ▐█ ▀█ ▪     ▐█ ▀. ██ ▐█ ▄█          "
	@echo -e ${CL_GRN}"           ▄█▀▀█  ▄█▀▄ ▄▀▀▀█▄▐█· ██▀·          "
	@echo -e ${CL_GRN}"           ▐█ ▪▐▌▐█▌.▐▌▐█▄▪▐█▐█▌▐█▪·•          "
	@echo -e ${CL_GRN}"            ▀  ▀  ▀█▄▀▪ ▀▀▀▀ ▀▀▀.▀             "
	@echo -e ""
	@echo -e "zip: "$(AOSIP_TARGET_PACKAGE)
	@echo -e "md5: `cat $(AOSIP_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"
	@echo -e "size:`ls -lah $(AOSIP_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

bacon: kronic
