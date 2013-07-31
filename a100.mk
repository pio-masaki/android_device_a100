#
# Copyright (C) 2012 The CyanogenMod Project
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
#

# ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/ramdisk/init.vangogh.usb.rc:root/init.vangogh.usb.rc \
    $(LOCAL_PATH)/prebuilt/ramdisk/ueventd.vangogh.rc:root/ueventd.vangogh.rc

ifeq ($(TARGET_PREBUILT_KERNEL),)
   LOCAL_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
else
   LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel


    
# copy kernel modules - these should match the above binary
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/modules/bcm4329.ko:system/lib/modules/bcm4329.ko \
    $(LOCAL_PATH)/prebuilt/modules/scsi_wait_scan.ko:system/lib/modules/scsi_wait_scan.ko


# hw permissions
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml

# prebuilt configs
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/vold.fstab:system/etc/vold.fstab \
    $(LOCAL_PATH)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/prebuilt/usr/idc/atmel-maxtouch.idc:system/usr/idc/atmel-maxtouch.idc \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/acer-dock.kl:system/usr/keylayout/acer-dock.kl \
    $(LOCAL_PATH)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

TARGET_BOOTANIMATION_NAME := horizontal-1024x600

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# tiny_hal
PRODUCT_PACKAGES += audio.primary.vangogh
PRODUCT_COPY_FILES += $(LOCAL_PATH)/prebuilt/etc/sound/tiny_hw.xml:system/etc/sound/a100.xml

$(call inherit-product, build/target/product/full_base.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, device/common/gps/gps_us_supl.mk)

# inherit t20-common
$(call inherit-product, device/acer/t20-common/t20-common.mk)

PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=160
    keyguard.no_require_sim=true \
    hwui.render_dirty_regions=false \
    hwui.disable_vsync=true \
    ro.setupwizard.mode=OPTIONAL \
    debug.sf.hw=1 \
    pm.sleep_mode=1 \
    windowsmgr.max_events_per_sec=150

# inherit proprietary files
$(call inherit-product-if-exists, vendor/acer/a100/a100-vendor.mk)

PRODUCT_DEVICE := a100
PRODUCT_MODEL  := A100
