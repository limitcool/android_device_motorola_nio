#
# Copyright (C) 2024-2026 PixelOS
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from nio device
$(call inherit-product, device/motorola/nio/device.mk)

# Inherit some common PixelOS stuff.
$(call inherit-product, vendor/aosp/config/common_full_phone.mk)

# Device identifier. This must come after all inclusions.
PRODUCT_NAME := pixelos_nio
PRODUCT_DEVICE := nio
PRODUCT_BRAND := Motorola
PRODUCT_MODEL := moto g(100)
PRODUCT_MANUFACTURER := motorola

# Build info
PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildDesc="nio_retcn-user 12 S1RN32.55-16-13 fce21a-b9f4e9 release-keys" \
    BuildFingerprint=motorola/nio_retcn/nio:12/S1RN32.55-16-13/fce21a-b9f4e9:user/release-keys \
    DeviceProduct=nio_retcn \
    SystemName=nio_retcn

# Setup Wizard & Connectivity optimization
PRODUCT_PRODUCT_PROPERTIES +=     ro.setupwizard.network_required=false     ro.setupwizard.mode=OPTIONAL     setupwizard.feature.predeferred_setup=false

PRODUCT_SYSTEM_PROPERTIES +=     ro.setupwizard.network_required=false     ro.setupwizard.mode=OPTIONAL     captive_portal_mode=1     captive_portal_https_url=https://connect.rom.miui.com/generate_204     captive_portal_http_url=http://connect.rom.miui.com/generate_204     captive_portal_fallback_url=http://captive.v2ex.co/generate_204


