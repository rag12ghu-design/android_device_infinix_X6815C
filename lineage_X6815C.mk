#
# Copyright (C) 2024-2026 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from X6815C device
$(call inherit-product, device/infinix/X6815C/device.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_phone.mk)

PRODUCT_DEVICE := X6815C
PRODUCT_NAME := lineage_X6815C
PRODUCT_BRAND := Infinix
PRODUCT_MODEL := Infinix X6815C
PRODUCT_MANUFACTURER := INFINIX

PRODUCT_GMS_CLIENTID_BASE := android-transsion

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="Infinix-X6815C-user 13 TP1A.220624.014 231008V345 release-keys" \
    BuildFingerprint=Infinix/X6815C-GL/Infinix-X6815C:13/TP1A.220624.014/231008V345:user/release-keys