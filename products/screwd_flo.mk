# Copyright (C) 2013 ParanoidAndroid Project
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
ifeq (screwd_flo,$(TARGET_PRODUCT))

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/asus/flo/full_flo.mk)

# Try to build the kernel
TARGET_KERNEL_SOURCE := kernel/asus/flo
TARGET_KERNEL_CONFIG := flo_defconfig
TARGET_VARIANT_CONFIG := flo_defconfig
TARGET_SELINUX_CONFIG := flo_defconfig
TARGET_GCC_VERSION_ARM := 4.9

# Override AOSP build properties
PRODUCT_NAME := screwd_flo
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 7
PRODUCT_MANUFACTURER := Asus
# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=razor \
    BUILD_FINGERPRINT=google/razor/flo:6.0.1/MOB30M/2862625:user/release-keys \
    PRIVATE_BUILD_DESC="razor-user 6.0.1 MOB30M 2862625 release-keys"
    
endif

#Optimize-it!!
export STRICT_ALIASING := true
export KRAIT_TUNINGS := true
export ENABLE_GCCONLY := true
export GRAPHITE_OPTS := true
export CLANG_O3 := true
export ENABLE_SANITIZE := true
export USE_PIPE := true

PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="Corey Edwards (MrApocalypse)"
