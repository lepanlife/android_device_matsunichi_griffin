#!/bin/bash

# Copyright (C) 2010 The Android Open Source Project
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

if [ -z "$1" ]; then
    echo "usage: extract-kernel.zip <source dir>" 1>&2
    exit 1
fi

source="$1"
destination=prebuilt/boot

mkdir -p "$destination"
cp "$1/MLO" "$1/iboot.ism" "$1/linux" "$destination/"

exit 0
