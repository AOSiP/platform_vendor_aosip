AOSIP_TARGET_PACKAGE := $(PRODUCT_OUT)/AOSiP-$(AOSIP_VERSION).zip

.PHONY: otapackage kronic
otapackage: $(INTERNAL_OTA_PACKAGE_TARGET)
kronic: otapackage
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(AOSIP_TARGET_PACKAGE)
	$(hide) $(MD5SUM) $(AOSIP_TARGET_PACKAGE) | cut -d ' ' -f1 > $(AOSIP_TARGET_PACKAGE).md5sum
	@echo -e "Package complete: $(AOSIP_TARGET_PACKAGE)"

