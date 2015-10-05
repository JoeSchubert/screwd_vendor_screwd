# Inherit common stuff
$(call inherit-product, vendor/screwd/config/common.mk)
$(call inherit-product, vendor/screwd/config/common_apn.mk)

# SIM Toolkit
PRODUCT_PACKAGES += \
    Stk
