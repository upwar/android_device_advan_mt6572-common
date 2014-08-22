#!/bin/sh

# Copyright (C) 2014 The Android Open Source Project
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

COMMONVENDOR=advan
COMMONDEVICE=mt6572-common
COMMONOUTDIR=vendor/$COMMONVENDOR/$COMMONDEVICE
COMMONANDROIDBOARDVENDOR=../../../$COMMONOUTDIR/AndroidBoardVendor.mk
COMMONDEVICEVENDOR=../../../$COMMONOUTDIR/$COMMONDEVICE-vendor.mk
COMMONDEVICEMAKEFILE=../../../$COMMONOUTDIR/$COMMONDEVICE-vendor-blobs.mk
COMMONBOARDCONFIGVENDOR=../../../$COMMONOUTDIR/BoardConfigVendor.mk

(cat << EOF) > $COMMONANDROIDBOARDVENDOR
# Copyright (C) 2014 The Android Open Source Project
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

# This file is generated by device/$COMMONVENDOR/$COMMONDEVICE/setup-makefiles.sh
LOCAL_PATH := \$(call my-dir)

include \$(CLEAR_VARS)
EOF

(cat << EOF) > $COMMONDEVICEVENDOR
# Copyright (C) 2014 The Android Open Source Project
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

# This file is generated by device/$COMMONVENDOR/$COMMONDEVICE/setup-makefiles.sh

include vendor/$COMMONVENDOR/$COMMONDEVICE/$COMMONDEVICE-vendor-blobs.mk

PRODUCT_COPY_FILES += \\
EOF

(cat << EOF) > $COMMONDEVICEMAKEFILE
# Copyright (C) 2014 The Android Open Source Project
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

# This file is generated by device/$COMMONVENDOR/$COMMONDEVICE/setup-makefiles.sh

BLOB_PATH := $COMMONOUTDIR/proprietary

PRODUCT_COPY_FILES += \\
EOF

LINEEND=" \\"
COUNT=`cat ../../advan/mt6572-common/common-proprietary-files.txt | grep -v ^# | grep -v ^$ | wc -l | awk {'print $1'}`
for FILE in `cat ../../advan/mt6572-common/common-proprietary-files.txt | grep -v ^# | grep -v ^$`; do
    COUNT=`expr $COUNT - 1`
    if [ $COUNT = "0" ]; then
        LINEEND=""
    fi
    echo "    \$(BLOB_PATH)/$FILE:$FILE$LINEEND" >> $COMMONDEVICEMAKEFILE
done

(cat << EOF) > $COMMONBOARDCONFIGVENDOR
# Copyright (C) 2014 The Android Open Source Project
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

# This file is generated by device/$COMMONVENDOR/$COMMONDEVICE/setup-makefiles.sh

MTK := true
MTK_KERNEL_POWER_OFF_CHARGING := true

EOF
