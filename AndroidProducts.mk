#
# Copyright (C) 2024-2026 PixelOS
#
# SPDX-License-Identifier: Apache-2.0
#

PRODUCT_MAKEFILES := \
    $(LOCAL_DIR)/pixelos_nio.mk \
    $(LOCAL_DIR)/lineage_nio.mk

COMMON_LUNCH_CHOICES := \
    pixelos_nio-userdebug \
    pixelos_nio-user \
    pixelos_nio-eng
