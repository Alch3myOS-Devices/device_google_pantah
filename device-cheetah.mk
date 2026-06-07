#
# SPDX-FileCopyrightText: 2021 The Android Open-Source Project
# SPDX-FileCopyrightText: The LineageOS Project
# SPDX-FileCopyrightText: The Calyx Institute
# SPDX-License-Identifier: Apache-2.0
#

# Always use scudo for memory allocator
PRODUCT_USE_SCUDO := true

# Pixel Kernel
TARGET_LINUX_KERNEL_VERSION := 6.1
TARGET_KERNEL_DEVICE := pantah
TARGET_KERNEL_PATH := device/google/pantah-kernels
TARGET_KERNEL_DIR := $(TARGET_KERNEL_PATH)/6.1
TARGET_BOARD_KERNEL_HEADERS := $(TARGET_KERNEL_DIR)/kernel-headers
TARGET_PREBUILT_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4
LOCAL_KERNEL := $(TARGET_KERNEL_DIR)/Image.lz4

LOCAL_PATH := device/google/pantah

# Inherit from gs201
include device/google/gs201/common.mk

# Overlays
PRODUCT_PACKAGES += \
    FrameworkResOverlayProductPantah \
    FrameworkResOverlayVendorPantah \
    ONSOverlayVendorPantah \
    PixelNfcOverlayPantah \
    SafetyRegulatoryInfoOverlayProductPantah \
    SystemUIGoogleOverlayVendorPantah

PRODUCT_PACKAGES += \
    DMServiceOverlayProductGs201 \
    DMServiceOverlayVendorCheetah \
    FrameworkResOverlayVendorCheetah \
    PixelNfcOverlayCheetah \
    PixelWifiOverlay2023_midyear_F10 \
    SettingsGoogleCheetahOverlay \
    SettingsGoogleOverlayProductCheetah \
    SettingsOverlayGE2AE \
    SettingsOverlayGFE4J \
    SettingsOverlayGP4BC \
    SystemUIGoogleOverlayVendorCheetah \
    Alch3mySettingsCheetah

PRODUCT_PACKAGES += \
    ApertureOverlayCheetah

# PowerShare
include hardware/google/pixel/powershare/device.mk

# Properties
TARGET_PRODUCT_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/product.prop
TARGET_VENDOR_PROP += $(DEVICE_PATH)/$(DEVICE_CODENAME)/vendor.prop

PRODUCT_PRODUCT_PROPERTIES += \
	ro.opa.eligible_device=true \
	ro.com.google.clientidbase=android-google \
	ro.com.google.ime.theme_id=5 \
	ro.com.google.ime.system_lm_dir=/product/usr/share/ime/google/d3_lms \
	ro.support_one_handed_mode=true \
	ro.quick_start.device_id=cheetah \
	ro.product.brand_for_attestation=google \
	ro.product.device_for_attestation=cheetah \
	ro.product.manufacturer_for_attestation=Google \
	ro.product.model_for_attestation=Pixel 7 Pro \
	ro.product.name_for_attestation=cheetah \

PRODUCT_PROPERTY_OVERRIDES += \
	keyguard.no_require_sim=true \
	debug.sf.enable_sdr_dimming=1 \
	debug.sf.dim_in_gamma_in_enhanced_screenshots=1 \
	ro.hardware.keystore_desede=true \
	ro.hardware.keystore=trusty \
	ro.hardware.gatekeeper=trusty \
	persist.vendor.enable.thermal.genl=true \
	ro.incremental.enable=true \
	vendor.usb.product_string=Pixel 7 Pro

PRODUCT_SYSTEM_EXT_PROPERTIES += \
ro.hotword.detection_service_required=false

# Recovery
PRODUCT_COPY_FILES += \
    $(DEVICE_PATH)/recovery/init.recovery.device.rc:$(TARGET_COPY_OUT_RECOVERY)/root/init.recovery.cheetah.rc

PRODUCT_PACKAGES += \
    init.recovery.cheetah.touch.rc

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
    $(DEVICE_PATH)

# UWB
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.uwb.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.uwb.xml

# VINTF
DEVICE_MANIFEST_FILE += \
    $(DEVICE_PATH)/vintf/manifest.xml
DEVICE_PRODUCT_COMPATIBILITY_MATRIX_FILE += \
    $(DEVICE_PATH)/vintf/device_framework_matrix_product.xml