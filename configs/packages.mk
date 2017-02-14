# Copyright (C) 2017 Screw'd AOSP
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

PRODUCT_PACKAGES += \
    masquerade

PRODUCT_PACKAGES += \
    Stk

#LockClock
PRODUCT_PACKAGES += \
    LockClock

#OmniSwitch
PRODUCT_PACKAGES += \
    OmniSwitch

#OmniJAWS
#PRODUCT_PACKAGES += \
#    OmniJaws

#AOSP Messenger
PRODUCT_PACKAGES += \
    messaging

#Gallery2
PRODUCT_PACKAGES += \
    Gallery2

#Default launcher
PRODUCT_PACKAGES += \
    Launcher3

#OmniStyle 
PRODUCT_PACKAGES += \
    OmniStyle

#Lean
PRODUCT_PACKAGES += \
    Lean

# DU Utils Library
PRODUCT_PACKAGES += \
    org.dirtyunicorns.utils

PRODUCT_BOOT_JARS += \
    org.dirtyunicorns.utils

ifeq ($(DEFAULT_ROOT_METHOD),magisk)
# Magisk Manager
PRODUCT_PACKAGES += \
    MagiskManager

# Copy Magisk zip
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/zip/magisk.zip:system/addon.d/magisk.zip

else ifeq ($(DEFAULT_ROOT_METHOD),supersu)
PRODUCT_PACKAGES += \
    Busybox

PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/zip/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/screwd/prebuilt/etc/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon  
endif
# Pull in Prebuilt applications 
$(call inherit-product-if-exists, vendor/prebuilt/prebuilt.mk)
    