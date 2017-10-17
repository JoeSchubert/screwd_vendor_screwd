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
PRODUCT_PACKAGE_OVERLAYS += vendor/screwd/overlay/common
PRODUCT_PACKAGE_OVERLAYS += vendor/screwd/overlay/$(TARGET_PRODUCT)

# Copy custom ramdisk
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/etc/init.screwd.rc:root/init.screwd.rc

# init.d script support
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/bin/sysinit:system/bin/sysinit

# userinit support
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/etc/init.d/90userinit:system/etc/init.d/90userinit

# backup script
 PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/bin/backuptool.sh:install/bin/backuptool.sh \
    vendor/screwd/prebuilt/bin/backuptool.functions:install/bin/backuptool.functions \
    vendor/screwd/prebuilt/bin/50-backupScript.sh:system/addon.d/50-backupScript.sh

# HOSTS file
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/etc/hosts:system/etc/hosts

# Include explicitly to work around Facelock issues
PRODUCT_PACKAGES += \
    libprotobuf-cpp-full

# APN
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/etc/apns-conf.xml:system/etc/apns-conf.xml   

# Sensitive Phone Numbers list
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/etc/sensitive_pn.xml:system/etc/sensitive_pn.xml

# Charging sounds
PRODUCT_COPY_FILES += \
    vendor/screwd/google/effects/BatteryPlugged.ogg:system/media/audio/ui/BatteryPlugged.ogg \
    vendor/screwd/google/effects/BatteryPlugged_48k.ogg:system/media/audio/ui/BatteryPlugged_48k.ogg

