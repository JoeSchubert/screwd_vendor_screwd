# Copyright (C) 2016 Screw'd AOSP
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

ifeq (screwd_angler,$(TARGET_PRODUCT))

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit AOSP device configuration for angler
$(call inherit-product, device/huawei/angler/aosp_angler.mk)

# Override AOSP build properties
PRODUCT_NAME := screwd_angler
PRODUCT_BRAND := google
PRODUCT_DEVICE := angler
PRODUCT_MODEL := Nexus 6P
PRODUCT_MANUFACTURER := Huawei

PRODUCT_PACKAGES += \
    AOSPLinks

endif

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:7.1.2/N2G48C/4104010:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 7.1.2 N2G48C 4104010 release-keys"

# Inline kernel building
TARGET_KERNEL_SOURCE := kernel/huawei/angler
TARGET_KERNEL_CONFIG := angler_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb
TARGET_KERNEL_CROSS_COMPILE_PREFIX := aarch64-linux-android-

# Enable real time lockscreen charging current values
BOARD_GLOBAL_CFLAGS += -DBATTERY_REAL_INFO

USING_CHOPPED64_KENREL = $(shell grep -rnw 'kernel/huawei/angler/arch/arm64/configs/angler_defconfig' -e "-Chopped64" -c)

ifeq ($(USING_CHOPPED64_KENREL),1)
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/etc/init.chopped64.rc:root/init.chopped64.rc
endif
