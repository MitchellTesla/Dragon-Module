#
# Copyright 2015 The Android Open Source Project
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
# Select the SoC
$(call set_soc, qcom, msm8916)
# Add wifi controlller
$(call add_peripheral, qcom, wifi/wcn3620)
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 268435456
BOARD_USERDATAIMAGE_PARTITION_SIZE := 134217728
BOARD_CACHEIMAGE_PARTITION_SIZE := 268435456
TARGET_BOARD_INFO_FILE := device/qcom/dragonboard/board-info.txt
PRODUCT_COPY_FILES += \
    device/qcom/dragonboard/fstab:root/fstab.${soc_name} \
    device/qcom/dragonboard/provision-device:provision-device
vendor_partition_directory := vendor/bsp/qcom/device/dragonboard/qcom_410c_non-hlos_binaries_A8016BAAAAGLYD2131.1
# BRILLO_VENDOR_PARTITIONS contains a list of strings in the format of
# parent_directory:file_path. Each vendor partition's full path is
# parent_directory/file_path. The directory structure in file_path will be
# preserved.
BRILLO_VENDOR_PARTITIONS := \
  $(vendor_partition_directory):partitions/misc.bin \
  $(vendor_partition_directory):partitions/partition-tables.bin \
  $(vendor_partition_directory):vendor_partitions/aboot.bin \
  $(vendor_partition_directory):vendor_partitions/DDR.bin \
  $(vendor_partition_directory):vendor_partitions/fsc.bin \
  $(vendor_partition_directory):vendor_partitions/fsg.bin \
  $(vendor_partition_directory):vendor_partitions/hyp.bin \
  $(vendor_partition_directory):vendor_partitions/modem.bin \
  $(vendor_partition_directory):vendor_partitions/modemst1.bin \
  $(vendor_partition_directory):vendor_partitions/modemst2.bin \
  $(vendor_partition_directory):vendor_partitions/rpm.bin \
  $(vendor_partition_directory):vendor_partitions/sbl1.bin \
  $(vendor_partition_directory):vendor_partitions/sec.bin \
  $(vendor_partition_directory):vendor_partitions/tz.bin
BOARD_SEPOLICY_DIRS += \
    device/qcom/dragonboard/sepolicy
TARGET_BOARD_PLATFORM := msm8916
# Enable bluetooth
BOARD_HAVE_BLUETOOTH_QCOM := true
QCOM_BT_USE_SMD_TTY := true
BLUETOOTH_HCI_USE_MCT := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := device/qcom/dragonboard/bluetooth
# Must be defined at the end of the file
$(call add_device_packages)
