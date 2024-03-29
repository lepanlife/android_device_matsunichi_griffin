#
# Copyright (C) 2007 The Android Open Source Project
# Copyright (C) 2011 The Cyanogenmod Project
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

# BoardConfig.mk
#
# Product-specific compile-time definitions.
#

BUILD_NETD := false

# inherit from the proprietary version
-include vendor/matsunichi/griffin/BoardConfigVendor.mk

TARGET_BOARD_PLATFORM := omap3
TARGET_CPU_ABI := armeabi-v7a
TARGET_CPU_ABI2 := armeabi
TARGET_ARCH_VARIANT := armv7-a-neon
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_GLOBAL_CFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp 
TARGET_GLOBAL_CPPFLAGS += -mtune=cortex-a8 -mfpu=neon -mfloat-abi=softfp 
TARGET_BOOTLOADER_BOARD_NAME := griffin
TARGET_PROVIDES_INIT_TARGET_RC := true
TARGET_USERIMAGES_USE_EXT4 := true
OMAP_ENHANCEMENT := true

BOARD_CUSTOM_BOOTIMG_MK := device/matsunichi/griffin/uboot-bootimg.mk
TARGET_RELEASETOOL_IMG_FROM_TARGET_SCRIPT := ./device/matsunichi/griffin/releasetools/griffin_img_from_target_files
TARGET_RELEASETOOL_OTA_FROM_TARGET_SCRIPT := ./device/matsunichi/griffin/releasetools/griffin_ota_from_target_files
# Include a 2ndbootloader
TARGET_BOOTLOADER_IS_2ND := true
###INSTALLED_2NDBOOTLOADER_TARGET := ./device/matsunichi/griffin/prebuilt/boot/iboot.ism

BOARD_KERNEL_CMDLINE :=
BOARD_KERNEL_BASE := 0x81000000
BOARD_PAGE_SIZE := 0x00000800

TARGET_USERIMAGES_USE_EXT4 := true
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 240517120
BOARD_FLASH_BLOCK_SIZE := 4096

TARGET_PREBUILT_KERNEL := device/matsunichi/griffin/prebuilt/boot/linux

BOARD_HAS_LARGE_FILESYSTEM := true
BOARD_RECOVERY_IGNORE_BOOTABLES := true
BOARD_CUSTOM_RECOVERY_KEYMAPPING := ../../device/matsunichi/griffin/recovery/recovery_ui.c
TARGET_RECOVERY_PRE_COMMAND := "dd if=/dev/zero of=/rom/bcb bs=64 count=1 > /dev/null 2>&1 ; echo 'recovery' >> /rom/bcb ; sync"

# audio stuff
BOARD_USES_AUDIO_LEGACY := true

#HARDWARE_OMX := true

# Modem
TARGET_NO_RADIOIMAGE := true

# HW Graphics (EGL fixes + webkit fix)
# USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := device/matsunichi/griffin/prebuilt/lib/egl/egl.cfg
#COMMON_GLOBAL_CFLAGS += -DMISSING_EGL_EXTERNAL_IMAGE \
#			-DMISSING_EGL_PIXEL_FORMAT_YV12 \
#			-DMISSING_GRALLOC_BUFFERS

# Workaround for eglconfig error
BOARD_NO_RGBX_8888 := true

# Storage
BOARD_HAS_SDCARD_INTERNAL := true
BOARD_SDCARD_DEVICE_PRIMARY := /dev/block/mmcblk1p1
BOARD_SDCARD_DEVICE_SECONDARY := /dev/block/mmcblk0p8
BOARD_SDCARD_DEVICE_INTERNAL := /dev/block/mmcblk0p8
BOARD_VOLD_MAX_PARTITIONS := 8
BOARD_VOLD_EMMC_SHARES_DEV_MAJOR := true

# Wifi
USES_TI_WL1271 := true
BOARD_WPA_SUPPLICANT_DRIVER := CUSTOM
ifdef USES_TI_WL1271
BOARD_WLAN_DEVICE           := wl1271
#BOARD_SOFTAP_DEVICE         := wl1271
endif
WPA_SUPPLICANT_VERSION      := VER_0_6_X
WIFI_DRIVER_MODULE_PATH     := "/system/lib/modules/tiwlan_drv.ko"
WIFI_DRIVER_MODULE_NAME     := "tiwlan_drv"
WIFI_FIRMWARE_LOADER        := "wlan_loader"
WIFI_DRIVER_MODULE_ARG      := ""

# Bluetooth
BOARD_HAVE_BLUETOOTH := true

BOARD_HAVE_FAKE_GPS := true

USE_CAMERA_STUB := true
BOARD_USES_TI_OMAP_MODEM_AUDIO := false
BOARD_HAS_NO_MISC_PARTITION := true

ifdef HARDWARE_OMX
OMX_JPEG := true
OMX_VENDOR := ti
OMX_VENDOR_INCLUDES := \
  hardware/ti/omx/system/src/openmax_il/omx_core/inc \
  hardware/ti/omx/image/src/openmax_il/jpeg_enc/inc
OMX_VENDOR_WRAPPER := TI_OMX_Wrapper
BOARD_OPENCORE_LIBRARIES := libOMX_Core
BOARD_OPENCORE_FLAGS := -DHARDWARE_OMX=1
BOARD_CAMERA_LIBRARIES := libcamera
endif
      
ifdef OMAP_ENHANCEMENT
COMMON_GLOBAL_CFLAGS += -DOMAP_ENHANCEMENT
endif

BOARD_USES_SECURE_SERVICES := true

#adb has root
ADDITIONAL_DEFAULT_PROPERTIES += ro.secure=0

TARGET_PROVIDES_LIBAUDIO := true
