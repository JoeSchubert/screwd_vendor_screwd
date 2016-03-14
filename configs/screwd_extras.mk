# Copyright (C) 2014 ParanoidAndroid Project
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


PRODUCT_PROPERTY_OVERRIDES += \
    ro.build.selinux=1

ifeq (MILESTONE,$(SCREWD_BUILD_TYPE))
PRODUCT_PACKAGES += \
    ScrewdOTA
endif

#Snap
#PRODUCT_PACKAGES += \
#    Snap

PRODUCT_PACKAGES += \
    Busybox

#Chromium
PRODUCT_PACKAGES += \
    Chromium

#LockClock
PRODUCT_PACKAGES += \
    LockClock

#OmniSwitch
PRODUCT_PACKAGES += \
    OmniSwitch

#AOSP Messenger
PRODUCT_PACKAGES += \
    messaging

#Gallery2
PRODUCT_PACKAGES += \
    Gallery2

#Default launcher
PRODUCT_PACKAGES += \
    Launcher3

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
    

