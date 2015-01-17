#
# This policy configuration will be used by all products that
# inherit from CM
#

BOARD_SEPOLICY_DIRS += \
    vendor/screwd/sepolicy

BOARD_SEPOLICY_UNION += \
    file.te \
    file_contexts \
    genfs_contexts \
    seapp_contexts \
    service_contexts \
    app.te \
    auditd.te \
    bootanim.te \
    installd.te \
    netd.te \
    sysinit.te \
    system.te \
    ueventd.te \
    vold.te \
    zygote.te \
    mac_permissions.xml
