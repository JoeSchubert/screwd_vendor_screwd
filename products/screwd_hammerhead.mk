# Copyright (C) 2013 ParanoidAndroid Project
# Copyright (C) 2014 Screw'd Android Project
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

# OVERLAY_TARGET adds overlay asset source
OVERLAY_TARGET := screwd_xhdpi

# Build paprefs from sources
PREFS_FROM_SOURCE ?= true

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit AOSP device configuration
$(call inherit-product, device/lge/hammerhead/full_hammerhead.mk)

# Override AOSP build properties
PRODUCT_NAME := screwd_hammerhead
PRODUCT_BRAND := Google
PRODUCT_MODEL := Nexus 5
PRODUCT_MANUFACTURER := LGE
PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=hammerhead BUILD_FINGERPRINT="google/hammerhead/hammerhead:5.0.1/LRX22C/1602158:user/release-keys" PRIVATE_BUILD_DESC="hammerhead-user 5.0.1 LRX22C 1602158 release-keys"

endif
