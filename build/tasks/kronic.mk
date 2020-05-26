AOSIP_TARGET_PACKAGE := $(PRODUCT_OUT)/AOSiP-$(AOSIP_VERSION).zip
AOSIP_UPDATE_PACKAGE := $(PRODUCT_OUT)/AOSiP-$(AOSIP_VERSION)-img.zip

.PHONY: kronic
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
	@echo -e "zip: "$(AOSIP_TARGET_PACKAGE)
	@echo -e "md5: `cat $(AOSIP_TARGET_PACKAGE).md5sum | cut -d ' ' -f 1`"
	@echo -e "size:`ls -lah $(AOSIP_TARGET_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

.PHONY: kronicpackage
kronicpackage: updatepackage
	$(hide) mv $(INTERNAL_UPDATE_PACKAGE_TARGET) $(AOSIP_UPDATE_PACKAGE)
	$(hide) $(MD5SUM) $(AOSIP_UPDATE_PACKAGE) | cut -d ' ' -f1 > $(AOSIP_UPDATE_PACKAGE).md5sum
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}AOSiP ${txtrst}";
	@echo -e ""
	@echo -e ${CL_GRN}"            ▄▄▄·       .▄▄ · ▪   ▄▄▄·          "
	@echo -e ${CL_GRN}"           ▐█ ▀█ ▪     ▐█ ▀. ██ ▐█ ▄█          "
	@echo -e ${CL_GRN}"           ▄█▀▀█  ▄█▀▄ ▄▀▀▀█▄▐█· ██▀·          "
	@echo -e ${CL_GRN}"           ▐█ ▪▐▌▐█▌.▐▌▐█▄▪▐█▐█▌▐█▪·•          "
	@echo -e ${CL_GRN}"            ▀  ▀  ▀█▄▀▪ ▀▀▀▀ ▀▀▀.▀             "
	@echo -e ""
	@echo -e "zip: "$(AOSIP_UPDATE_PACKAGE)
	@echo -e "md5: `cat $(AOSIP_UPDATE_PACKAGE).md5sum | cut -d ' ' -f 1`"
	@echo -e "size:`ls -lah $(AOSIP_UPDATE_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""

.PHONY: kronicrelease
kronicrelease: otapackage updatepackage
	$(hide) mv $(INTERNAL_OTA_PACKAGE_TARGET) $(AOSIP_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(AOSIP_TARGET_PACKAGE) | cut -d ' ' -f1 > $(AOSIP_TARGET_PACKAGE).md5sum
	$(hide) mv $(INTERNAL_UPDATE_PACKAGE_TARGET) $(AOSIP_UPDATE_PACKAGE)
	$(hide) $(MD5SUM) $(AOSIP_UPDATE_PACKAGE) | cut -d ' ' -f1 > $(AOSIP_UPDATE_PACKAGE).md5sum
	@echo -e ""
	@echo -e "${cya}Building ${bldcya}AOSiP ${txtrst}";
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
	@echo -e "zip: "$(AOSIP_UPDATE_PACKAGE)
	@echo -e "md5: `cat $(AOSIP_UPDATE_PACKAGE).md5sum | cut -d ' ' -f 1`"
	@echo -e "size:`ls -lah $(AOSIP_UPDATE_PACKAGE) | cut -d ' ' -f 5`"
	@echo -e ""
