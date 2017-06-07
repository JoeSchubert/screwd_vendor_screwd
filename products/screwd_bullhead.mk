# Copyright (C) 2015 Screw'd AOSP
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

# Check for target product

ifeq (screwd_bullhead,$(TARGET_PRODUCT))

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit AOSP device configuration for bullhead
$(call inherit-product, device/lge/bullhead/aosp_bullhead.mk)

# Override AOSP build properties
PRODUCT_NAME := screwd_bullhead
PRODUCT_DEVICE := bullhead
PRODUCT_BRAND := google
PRODUCT_MODEL := Nexus 5X
PRODUCT_MANUFACTURER := LGE
PRODUCT_RESTRICT_VENDOR_FILES := false

endif

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=bullhead \
    BUILD_FINGERPRINT=google/bullhead/bullhead:7.1.2/N2G47W/3938523:user/release-keys \
    PRIVATE_BUILD_DESC="bullhead-user 7.1.2 N2G47W 3938523 release-keys"

# Enable real time lockscreen charging current values
BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO


# Inline kernel building
TARGET_GCC_VERSION_ARM64 := 4.9
TARGET_KERNEL_SOURCE := kernel/lge/bullhead
TARGET_KERNEL_CONFIG := bullhead_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
