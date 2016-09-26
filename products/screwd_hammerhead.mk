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

ifeq (screwd_hammerhead,$(TARGET_PRODUCT))

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/lge/hammerhead/full_hammerhead.mk)

# Override AOSP build properties
PRODUCT_NAME := screwd_hammerhead
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE

endif

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=hammerhead \
    BUILD_FINGERPRINT=google/hammerhead/hammerhead:6.0.1/MOB30Y/3067468:user/release-keys \
    PRIVATE_BUILD_DESC="hammerhead-user 6.0.1 MOB30Y 3067468 release-keys"

# Kernel inline build
TARGET_KERNEL_SOURCE := kernel/lge/hammerhead
TARGET_KERNEL_CONFIG := hammerhead_defconfig
TARGET_GCC_VERSION_ARM := 4.9

#Optimize-it!!
#export STRICT_ALIASING := true
#export KRAIT_TUNINGS := true
#export ENABLE_GCCONLY := true
#export GRAPHITE_OPTS := true
#export CLANG_O3 := true
#export ENABLE_SANITIZE := true
#export USE_PIPE := true

PRODUCT_BUILD_PROP_OVERRIDES += \
	DEVICE_MAINTAINERS="MrApocalypse, Fabio Borda (fabi92)"
