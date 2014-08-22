# Copyright (C) 2009 The Android Open Source Project
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

LOCAL_PATH := $(call my-dir)

$(call config-custom-folder,custom:hal/sensors)
# HAL module implemenation, not prelinked and stored in
# hw/<SENSORS_HARDWARE_MODULE_ID>.<ro.hardware>.so
include $(CLEAR_VARS)
#-include $(MTK_PATH_SOURCE)/hardware/sensor/hwmsen/custom/hal/$(MTK_PROJECT)/mtk_cust.mk
LOCAL_PRELINK_MODULE := false
LOCAL_MODULE_PATH := $(TARGET_OUT_SHARED_LIBRARIES)/hw
LOCAL_SHARED_LIBRARIES := liblog libcutils
LOCAL_SRC_FILES := sensors_hwmsen.c  hwmsen_chip_info.c 
LOCAL_C_INCLUDES+= \
        device/advan/mt6572-common/hardware/sensor/hwmsen/ \
	device/advan/mt6572-common/hardware/sensor/hwmsen/custom/

LOCAL_MODULE := sensors.default

include $(BUILD_SHARED_LIBRARY)
