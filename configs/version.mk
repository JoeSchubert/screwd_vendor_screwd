# Versioning System
PRODUCT_VERSION_MAJOR = 3
PRODUCT_VERSION_MINOR = 0
PRODUCT_VERSION_MAINTENANCE = 0
ifdef SCREWD_BUILD_EXTRA
    SCREWD_POSTFIX := -$(SCREWD_BUILD_EXTRA)
endif
ifndef SCREWD_BUILD_TYPE
    SCREWD_BUILD_TYPE := UNOFFICIAL
endif

SCREWD_POSTFIX := $(shell date +"%Y%m%d-%H%M")
SCREWD_DEVICE_SHORT := $(SCREWD_DEVICE)
SCREWD_DEVICE_SHORT := $(subst screwd_,,$(SCREWD_DEVICE_SHORT))

# Set all versions
SCREWD_VERSION := $(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR).$(PRODUCT_VERSION_MAINTENANCE)-$(SCREWD_BUILD_TYPE)-$(SCREWD_POSTFIX)
SCREWD_MOD_VERSION := screwd-$(SCREWD_DEVICE_SHORT)-$(SCREWD_VERSION)

PRODUCT_PROPERTY_OVERRIDES += \
    BUILD_DISPLAY_ID=$(BUILD_ID) \
    ro.ota.version=$(PRODUCT_VERSION_MAJOR)-$(SCREWD_POSTFIX) \
    ro.screwd.version=$(SCREWD_VERSION) \
    ro.modversion=$(SCREWD_MOD_VERSION) \
    ro.screwd.buildtype=$(SCREWD_BUILD_TYPE)

# DragonTC info
#DRAGONTC_VERSION := 3.9
#export $(DRAGONTC_VERSION)

#DTC_PATH := prebuilts/clang/linux-x86/host/$(DRAGONTC_VERSION)
#DTC_VER := $(shell cat $(DTC_PATH)/VERSION)
#export $(DTC_VER)

#PRODUCT_PROPERTY_OVERRIDES += \
#    ro.dtc.version=$(DTC_VER)

