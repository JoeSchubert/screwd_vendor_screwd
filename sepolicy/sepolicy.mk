#
# This policy configuration will be used by all products that
#

BOARD_SEPOLICY_DIRS += \
    vendor/screwd/sepolicy

BOARD_SEPOLICY_UNION += \
    mediaserver.te \
    shell.te \
    system.te \
    service_contexts \
    file_contexts 
