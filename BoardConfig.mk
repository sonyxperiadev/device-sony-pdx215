# Copyright 2014 The Android Open Source Project
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

include device/sony/sagami/PlatformConfig.mk

TARGET_BOOTLOADER_BOARD_NAME := unknown
ifneq (,$(filter %xqbc52,$(TARGET_PRODUCT)))
TARGET_BOOTLOADER_BOARD_NAME := XQ-BC52
else
TARGET_BOOTLOADER_BOARD_NAME := XQ-BC52
$(warning Unrecognized value for TARGET_PRODUCT: "$(TARGET_PRODUCT)", using default value: "$(TARGET_BOOTLOADER_BOARD_NAME)")
endif

# Platform
PRODUCT_PLATFORM := sagami

# Kernel cmdline
BOARD_KERNEL_CMDLINE += androidboot.hardware=pdx215
BOARD_KERNEL_CMDLINE += androidboot.fstab_suffix=pdx215

# Partition information
BOARD_FLASH_BLOCK_SIZE := 131072 # (BOARD_KERNEL_PAGESIZE * 64)
BOARD_BOOTIMAGE_PARTITION_SIZE := 0x06000000
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 100663296
BOARD_DTBOIMG_PARTITION_SIZE := 0x01800000

BOARD_ODMIMAGE_PARTITION_SIZE := 1610612736

BOARD_SUPER_PARTITION_SIZE := 14495514624
BOARD_SUPER_PARTITION_GROUPS := sod_dynamic_partitions

# Set error limit to SUPER_PARTITION_SIZE - 500MiB
BOARD_SUPER_PARTITION_ERROR_LIMIT := 13971226624

# DYNAMIC_PARTITIONS_SIZE = (SUPER_PARTITION_SIZE / 2) - 4MiB
BOARD_SOD_DYNAMIC_PARTITIONS_SIZE := 7243563008
BOARD_SOD_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    vendor \
    product

# Slightly overprovision dynamic partitions with 50MiB to
# allow on-device file editing
BOARD_SYSTEMIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_SYSTEM_EXTIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_VENDORIMAGE_PARTITION_RESERVED_SIZE := 52428800
BOARD_PRODUCTIMAGE_PARTITION_RESERVED_SIZE := 52428800

# Reserve space for data encryption (0x36e4f5f000-0x4000)
BOARD_USERDATAIMAGE_PARTITION_SIZE := 235769540608
