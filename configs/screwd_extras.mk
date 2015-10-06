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

#ifeq (OFFICIAL,$(ROM_VERSION_TAG))
#PRODUCT_PACKAGES += \
#    ScrewdOTA
#endif


#ifeq (screwd_hammerhead,$(TARGET_PRODUCT))
#    PRODUCT_PROPERTY_OVERRIDES += \
#        ro.ota.screwd=ScrewdAOSP-$(ROM_VERSION_TAG) \
#	ro.ota.version=$(shell date +"%Y%m%d") \
#	ro.ota.manifest=https://dl.dropboxusercontent.com/u/18151599/OTA/hammerhead/ota.xml
#endif

#ifeq (screwd_flo,$(TARGET_PRODUCT))
#    PRODUCT_PROPERTY_OVERRIDES += \
#        ro.ota.screwd=ScrewdAOSP-$(ROM_VERSION_TAG) \
#	ro.ota.version=$(shell date +"%Y%m%d") \#
#	ro.ota.manifest=https://dl.dropboxusercontent.com/u/18151599/OTA/flo/ota.xml
#endif

# Extra tools
PRODUCT_PACKAGES += \
    e2fsck \
    mount.exfat \
    fsck.exfat \
    mkfs.exfat
    

