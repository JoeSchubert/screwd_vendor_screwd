#
# Copyright (C) 2018 Screw'd AOSP
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

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)
$(call inherit-product, vendor/screwd/configs/caf_required.mk)


ifeq (screwd_dumpling,$(TARGET_PRODUCT))

# Include Screw'd common configuration
include vendor/screwd/main.mk

# Inherit from dumpling device
$(call inherit-product, device/oneplus/dumpling/device.mk)

PRODUCT_NAME := screwd_dumpling
PRODUCT_DEVICE := dumpling
PRODUCT_MANUFACTURER := OnePlus
PRODUCT_BRAND := OnePlus
PRODUCT_MODEL := ONEPLUS A5010

PRODUCT_GMS_CLIENTID_BASE := android-oneplus

TARGET_VENDOR_PRODUCT_NAME := OnePlus5T
TARGET_VENDOR_DEVICE_NAME := OnePlus5T

PRODUCT_BUILD_PROP_OVERRIDES += TARGET_DEVICE=OnePlus5T PRODUCT_NAME=OnePlus5T


TARGET_VENDOR := oneplus

TARGET_KERNEL_SOURCE := kernel/oneplus/msm8998
TARGET_KERNEL_CONFIG := oneplus5_defconfig
TARGET_KERNEL_CLANG_COMPILE := true

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="OnePlus5T-user 8.1.0 OPM1.171019.011 1 release-keys"

BUILD_FINGERPRINT := OnePlus/OnePlus5T/OnePlus5T:8.1.0/OPM1.171019.011/04110359:user/release-keys

PRODUCT_PROPERTY_OVERRIDES += \
    ro.screwd.device.short=$(SCREWD_DEVICE_SHORT) \

endif
