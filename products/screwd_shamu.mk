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

ifeq (screwd_shamu,$(TARGET_PRODUCT))

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/moto/shamu/aosp_shamu.mk)

# Override AOSP build properties
PRODUCT_NAME := screwd_shamu
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 6
PRODUCT_MANUFACTURER := motorola

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=shamu \
    BUILD_FINGERPRINT=google/shamu/shamu:6.0.1/MOB30M/2862625:user/release-keys \
    PRIVATE_BUILD_DESC="shamu-user 6.0.1 MOB30M 2862625 release-keys"

endif

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/moto/shamu
TARGET_KERNEL_CONFIG := B14CKB1RD_defconfig
TARGET_GCC_VERSION_ARM := 5.3

#Optimize-it!!
export STRICT_ALIASING := true

#Optimize-it!!
export STRICT_ALIASING := true
export ENABLE_GCCONLY := true
export KRAIT_TUNINGS := true
export GRAPHITE_OPTS := true
export CLANG_O3 := true
export ENABLE_SANITIZE := true
export USE_PIPE := true

PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Brandon Shawhan (brandonabandon)"
