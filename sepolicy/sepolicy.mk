#
# This policy configuration will be used by all products that
# inherit from CM
#

BOARD_SEPOLICY_DIRS += \
    vendor/screwd/sepolicy

BOARD_SEPOLICY_UNION += \
    drmserver.te \
    file.te \
    file_contexts \
    genfs_contexts \
    property_contexts \
    seapp_contexts \
    service_contexts \
    app.te \
    auditd.te \
    mediaserver.te \
    bootanim.te \
    healthd.te \
    hostapd.te \
    installd.te \
    netd.te \
    property.te \
    recovery.te \
    shell.te \
    sysinit.te \
    system.te \
    ueventd.te \
    vold.te \
    zygote.te \
    mac_permissions.xml
