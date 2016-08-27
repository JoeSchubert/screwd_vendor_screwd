# Copyright (C) 2013 ParanoidAndroid Project
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

# Include overlays
PRODUCT_PACKAGE_OVERLAYS += vendor/$(VENDOR)/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/$(VENDOR)/overlay/$(TARGET_PRODUCT)

# Copy custom ramdisk
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/init.$(VENDOR).rc:root/init.$(VENDOR).rc

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# backup script
 PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/bin/backuptool.sh:system/bin/backuptool.sh \
    vendor/$(VENDOR)/prebuilt/bin/backuptool.functions:system/bin/backuptool.functions \
    vendor/$(VENDOR)/prebuilt/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# SuperSU
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/common/UPDATE-SuperSU.zip:system/addon.d/UPDATE-SuperSU.zip \
    vendor/screwd/prebuilt/etc/99SuperSUDaemon:system/etc/init.d/99SuperSUDaemon  

# HOSTS file
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/etc/hosts:system/etc/hosts

#ifneq ($(filter screwd_flo screwd_hammerhead screwd_shamu,$(TARGET_PRODUCT)),)
# media effects
#PRODUCT_COPY_FILES +=  \
#    vendor/screwd/prebuilt/media/LMspeed_508.emd:system/vendor/media/LMspeed_508.emd \
#    vendor/screwd/prebuilt/media/PFFprec_600.emd:system/vendor/media/PFFprec_600.emd
#endif

# APN
PRODUCT_COPY_FILES += \
    vendor/$(VENDOR)/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml   

