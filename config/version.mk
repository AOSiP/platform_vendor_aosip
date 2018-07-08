# Copyright (C) 2016-2017 AOSiP
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# Versioning System
PRODUCT_VERSION_MAJOR = 8
PRODUCT_VERSION_MINOR = 1

DATE := $(shell date +%Y%m%d)

AOSIP_BUILDTYPE ?= Bare
AOSIP_BUILD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)
AOSIP_VERSION := $(AOSIP_BUILD_VERSION)-$(AOSIP_BUILDTYPE)-$(AOSIP_BUILD)-$(DATE)

PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
  ro.aosip.build.version=$(AOSIP_BUILD_VERSION) \
  ro.aosip.build.date=$(DATE) \
  ro.aosip.buildtype=$(AOSIP_BUILDTYPE) \
  ro.aosip.version=$(AOSIP_VERSION) \
  ro.aosip.device=$(AOSIP_BUILD) \
  ro.modversion=$(AOSIP_VERSION)
