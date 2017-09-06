#
# Copyright 2017 Screw'd AOSP
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
#

# Sample: This is where we'd set a backup provider if we had one
# $(call inherit-product, device/sample/products/backup_overlay.mk)


# Check for target product
ifeq (screwd_marlin,$(TARGET_PRODUCT))
endif

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit aosp_marlin
$(call inherit-product, device/google/marlin/aosp_marlin.mk)

PRODUCT_NAME := screwd_marlin
PRODUCT_DEVICE := marlin
PRODUCT_BRAND := google
PRODUCT_MODEL := Pixel XL
PRODUCT_MANUFACTURER := Google

# Device Fingerprint
PRODUCT_BUILD_PROP_OVERRIDES += \
    PRODUCT_NAME=marlin \
    BUILD_FINGERPRINT=google/marlin/marlin:8.0.0/OPR6.170623.012/4283428:user/release-keys \
    PRIVATE_BUILD_DESC="marlin-user 8.0.0 OPR6.170623.012 4283428 release-keys"
