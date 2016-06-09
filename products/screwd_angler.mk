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

endif

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=angler \
    BUILD_FINGERPRINT=google/angler/angler:6.0.1/MTC19V/2862947:user/release-keys \
    PRIVATE_BUILD_DESC="angler-user 6.0.1 MTC19V 2862947 release-keys"


# Inline kernel building
TARGET_GCC_VERSION_ARM64 := 6.0
TARGET_KERNEL_SOURCE := kernel/huawei/angler
TARGET_KERNEL_CONFIG := saber_defconfig
BOARD_KERNEL_IMAGE_NAME := Image.gz-dtb

#Optimize-it!!
export STRICT_ALIASING := true
export ENABLE_GCCONLY := true
export GRAPHITE_OPTS := true
export CLANG_O3 := true
export CORTEX_TUNINGS := true
export ENABLE_SANITIZE := true
export USE_PIPE := true

PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="David Smit (dsmitty166) & Dustin Rinne (f100cleveland)"
