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

# Google property overides
PRODUCT_PROPERTY_OVERRIDES += \
    keyguard.no_require_sim=true \
    ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
    ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
    ro.atrace.core.services=com.google.android.gms,com.google.android.gms.ui,com.google.android.gms.persistent \
    ro.com.google.clientidbase=android-google \
    ro.com.android.wifi-watchlist=GoogleGuest \
    ro.error.receiver.system.apps=com.google.android.gms \
    ro.setupwizard.enterprise_mode=1 \
    ro.com.android.dateformat=MM-dd-yyyy \
    ro.setupwizard.network_required=false \
    net.tethering.noprovisioning=true \
    persist.sys.dun.override=0 \
    ro.debuggable=1 \
    ro.adb.secure=0

# Backup Services whitelist
PRODUCT_COPY_FILES += \
    vendor/screwd/configs/permissions/backup.xml:system/etc/sysconfig/backup.xml

# Enable SIP+VoIP
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

# Proprietary latinime libs needed for Keyboard swyping
ifneq ($(filter screwd_hammerhead screwd_flo screwd_shamu,$(TARGET_PRODUCT)),)
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/lib/libjni_latinime.so:system/lib/libjni_latinime.so
else
PRODUCT_COPY_FILES += \
    vendor/screwd/prebuilt/lib64/libjni_latinime.so:system/lib64/libjni_latinime.so
endif
