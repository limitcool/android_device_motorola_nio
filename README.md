# Motorola Edge S / Moto G100 (nio) - Android 16 (PixelOS 16.0)

[![Android](https://img.shields.io/badge/Android-16.0%20(Baklava)-34A853?logo=android&logoColor=white)](https://android.googlesource.com/)
[![PixelOS](https://img.shields.io/badge/PixelOS-16.0-4285F4?logo=google&logoColor=white)](https://pixelos.net/)
[![SourceForge Downloads](https://img.shields.io/badge/Download-SourceForge-FFA500?logo=sourceforge&logoColor=white)](https://sourceforge.net/projects/pixelos-nio/)
[![License](https://img.shields.io/badge/License-Apache%202.0%20%2F%20GPL%20v2-blue)](LICENSE)

Official Bringup & Device Trees for Motorola Edge S / Moto G100 (`nio`) running Android 16 (PixelOS 16.0).

---

## Device Specifications

| Feature | Specification |
| :--- | :--- |
| **SoC** | Qualcomm SM8250 Snapdragon 870 5G (7 nm) |
| **CPU** | Octa-core (1x3.2 GHz Kryo 585 & 3x2.42 GHz Kryo 585 & 4x1.8 GHz Kryo 585) |
| **GPU** | Adreno 650 |
| **Memory** | 6GB / 8GB / 12GB LPDDR5 |
| **Storage** | 128GB / 256GB UFS 3.1 |
| **Battery** | 5000 mAh (20W TurboPower) |
| **Display** | 6.7" CinemaVision IPS LCD, 1080 x 2520 pixels (21:9), 90Hz, HDR10 |
| **Rear Cameras** | 64 MP (f/1.7, wide) + 16 MP (f/2.2, ultrawide/macro) + 2 MP (depth) + TOF 3D |
| **Front Cameras**| 16 MP (f/2.2, wide) + 8 MP (f/2.4, ultrawide) |
| **Shipped Android** | Android 11 |

<p align="center">
  <img src="https://fdn2.gsmarena.com/vv/pics/motorola/motorola-moto-g100-ofic-01.jpg" alt="Motorola Moto G100 / Edge S" width="360"/>
</p>

---

## Android 16 Bringup Highlights & Stability Fixes

- **Pixel Experience 16.0 Core**: Native Android 16 (Baklava) UI, fluid Material You theming, and responsive system navigation.
- **Tianma & Aftermarket Touchscreen Fix**: Resolved the touchscreen freeze issue on Tianma / replacement LCD panels through early touch kernel module injection (`modules.load`).
- **Side Fingerprint Auto-healing**: Re-engineered HAL initialization and custom SELinux policies to prevent fingerprint daemon boot-time timeout and sleep wake-up failure.
- **Optimized UI Overlays**: Custom navigation bar dimension overrides (48dp) properly centering the 3-button layout on 21:9 displays.
- **SELinux Enforcing Ready**: Tailored vendor_init and fingerprint HAL policies compatible with Android 16 security constraints.

---

## Source Repositories Matrix

| Component | Repository Link | Branch | Description |
| :--- | :--- | :--- | :--- |
| **Device Tree** | [limitcool/android_device_motorola_nio](https://github.com/limitcool/android_device_motorola_nio) | `lineage-23.2` / `sixteen` | Main device configuration and overlays |
| **Common Tree** | [limitcool/android_device_motorola_sm8250-common](https://github.com/limitcool/android_device_motorola_sm8250-common) | `lineage-23.2` / `sixteen` | SM8250 platform HALs, touch init & init scripts |
| **Kernel Source** | [limitcool/android_kernel_motorola_sm8250](https://github.com/limitcool/android_kernel_motorola_sm8250) | `lineage-22.2` | Linux 4.19.325 kernel source (GPLv2 compliant) |

---

## How to Build from Source

### 1. Initialize Manifest
Set up your local manifest inside `.repo/local_manifests/roomservice.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="limitcool/android_device_motorola_nio" path="device/motorola/nio" remote="github" revision="sixteen" />
  <project name="limitcool/android_device_motorola_sm8250-common" path="device/motorola/sm8250-common" remote="github" revision="sixteen" />
  <project name="limitcool/android_kernel_motorola_sm8250" path="kernel/motorola/sm8250" remote="github" revision="lineage-22.2" />
  <project name="TheMuppets/proprietary_vendor_motorola_nio" path="vendor/motorola/nio" remote="github" revision="lineage-23.2" />
  <project name="TheMuppets/proprietary_vendor_motorola_sm8250-common" path="vendor/motorola/sm8250-common" remote="github" revision="lineage-23.2" />
</manifest>
```

### 2. Build the ROM
```bash
# Set up build environment
source build/envsetup.sh

# Select target
lunch pixelos_nio-userdebug

# Start compilation
m bacon -j$(nproc)
```

---

## Flashing Instructions

### Prerequisites
1. Unlocked Bootloader.
2. Latest platform-tools (`adb` and `fastboot`).
3. Download the ROM zip and firmware partitions from [SourceForge](https://sourceforge.net/projects/pixelos-nio/).

### Step 1: Flash Boot Partitions (Fastboot Mode)
Reboot phone into Fastboot Mode (`Volume Down + Power`):
```bash
fastboot flash boot boot.img
fastboot flash dtbo dtbo.img
fastboot flash vendor_boot vendor_boot.img
```

### Step 2: Boot Recovery & Sideload
1. On phone, use volume keys to select **Recovery Mode** and press Power to confirm.
2. In Recovery:
   - Select **Factory Reset** -> **Format data/factory reset** (Wipe data).
   - Go back to main menu, select **Apply update** -> **Apply from ADB**.
3. Sideload the ROM zip from your PC:
```bash
adb sideload PixelOS_nio-16.0-xxxx.zip
```
4. Once completed, select **Reboot system now**.

---

## Downloads & Links

- **ROM Releases**: [SourceForge - PixelOS for Moto G100](https://sourceforge.net/projects/pixelos-nio/)
- **XDA Discussion Thread**: Coming Soon on XDA Developers

---

## License & Credits
- **PixelOS Team** for the base ROM
- **LineageOS Community** for original SM8250 device trees
- **Maintainer**: [limitcool](https://github.com/limitcool)
