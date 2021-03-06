# Copyright (C) 2017 The Android Open Source Project
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
# This file is the build configuration for an aosp Android
# build for dragon hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, aosp and dragon, hence its name.
#
PRODUCT_COPY_FILES += \
    device/google/dragon/manifest_dragon_car.xml:vendor/manifest.xml
$(call inherit-product, packages/services/Car/car_product/build/car.mk)
$(call inherit-product, device/google/dragon/aosp_dragon.mk)
BOARD_SEPOLICY_DIRS += packages/services/Car/car_product/sepolicy
PRODUCT_NAME := aosp_dragon_car
PRODUCT_DEVICE := dragon
PRODUCT_BRAND := Android
PRODUCT_MODEL := Android Auto Embedded on dragon
PRODUCT_MANUFACTURER := Google
PRODUCT_RESTRICT_VENDOR_FILES := true
