#
# Copyright (C) 2019 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# inherit from common
include device/samsung/universal8890-common/BoardConfigCommon.mk

BUILD_BROKEN_ELF_PREBUILT_PRODUCT_COPY_FILES := true

DEVICE_PATH := device/samsung/hero2qlte

BOARD_USES_QCOM_HARDWARE := true
TARGET_USE_SDCLANG := true

# Bootloader
TARGET_NO_BOOTLOADER := true
TARGET_BOOTLOADER_BOARD_NAME := msm8996

# Platform
TARGET_BOARD_PLATFORM := msm8996
TARGET_BOARD_PLATFORM_GPU := qcom-adreno530
TARGET_PLATFORM_DEVICE_BASE := /devices/soc/
TARGET_QCOM_MEDIA_VARIANT := caf

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := kryo
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53

# Kernel
BOARD_KERNEL_BASE := 0x80000000
BOARD_KERNEL_CMDLINE := console=null androidboot.hardware=qcom msm_rtb.filter=0x237 ehci-hcd.park=3 lpm_levels.sleep_disabled=1 androidboot.selinux=permissive rcupdate.rcu_expedited=1 cma=32M@0-0xffffffff
BOARD_KERNEL_PAGESIZE := 4096
BOARD_RAMDISK_OFFSET := 0x02200000
BOARD_KERNEL_TAGS_OFFSET := 0x02000000
BOARD_MKBOOTIMG_ARGS += --ramdisk_offset $(BOARD_RAMDISK_OFFSET)
BOARD_MKBOOTIMG_ARGS += --tags_offset $(BOARD_KERNEL_TAGS_OFFSET)
BOARD_KERNEL_IMAGE_NAME := Image
BOARD_KERNEL_SEPARATED_DT := true
TARGET_KERNEL_CONFIG := msm8996_sec_defconfig
TARGET_KERNEL_DEVICE_DEFCONFIG := msm8996_sec_heroqlte_acg_defconfig 
TARGET_KERNEL_SOURCE := kernel/samsung

# Kernel - prebuilt
#TARGET_FORCE_PREBUILT_KERNEL := false
#ifeq ($(TARGET_FORCE_PREBUILT_KERNEL),true)
#TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
#TARGET_PREBUILT_DT := $(DEVICE_PATH)/prebuilt/dt.img
#BOARD_MKBOOTIMG_ARGS += --dt $(TARGET_PREBUILT_DT)
#BOARD_KERNEL_SEPARATED_DT :=
#endif

# Display
TARGET_SCREEN_DENSITY := 480
TARGET_USES_GRALLOC1 := true
TARGET_USES_HWC2 := true

# Partitions
BOARD_BOOTIMAGE_PARTITION_SIZE     := 0x004C00000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 0x004C00000
BOARD_SYSTEMIMAGE_PARTITION_SIZE   := 0x14E600000
BOARD_USERDATAIMAGE_PARTITION_SIZE := 0x64BFFC000 # 0x64C000000 - 16384 (footer)
BOARD_CACHEIMAGE_PARTITION_SIZE    := 0x012C00000
BOARD_FLASH_BLOCK_SIZE := 0x40000

# File systems
BOARD_HAS_LARGE_FILESYSTEM := true
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Assert
TARGET_OTA_ASSERT_DEVICE := bmc,hero2lteskt,hero2ltektt,hero2ltelgt,hero2ltexx,hero2qlte,hero2qltexx

# Bluetooth
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(DEVICE_PATH)/bluetooth

# Fingerprint
TARGET_SEC_FP_USES_PERCENTAGE_SAMPLES := true

# Init
TARGET_INIT_VENDOR_LIB := //$(DEVICE_PATH):libinit_hero2qlte

# Kernel
TARGET_KERNEL_SOURCE := kernel/samsung

# Shims
TARGET_LD_SHIM_LIBS += \
    /vendor/lib/libbauthserver.so|/vendor/lib/libbauthtzcommon_shim.so \
    /vendor/lib64/libbauthserver.so|/vendor/lib64/libbauthtzcommon_shim.so

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += $(DEVICE_PATH)

# Vendor security patch level
VENDOR_SECURITY_PATCH := 2021-04-01

# Init properties from bootloader version, ex. model info
TARGET_UNIFIED_DEVICE := true
TARGET_INIT_VENDOR_LIB := libinit_hero2qlte
TARGET_RECOVERY_DEVICE_MODULES := libinit_hero2qlte
TARGET_LIBINIT_DEFINES_FILE := $(DEVICE_TREE)/init/init_hero2qlte.cpp

# inherit from the proprietary version
include vendor/samsung/hero2qlteue/BoardConfigVendor.mk
