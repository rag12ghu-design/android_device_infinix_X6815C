# LineageOS 22.2 Device Tree for Infinix Zero 5G 2023 (X6815C)

The **Infinix Zero 5G 2023** (codename `X6815C`) is a mid-high tier smartphone from Infinix announced in December 2022 and released in February 2023.

This repository provides an authentic, hardware-grounded device tree for building **LineageOS 22.2 (Android 15)**. All configurations, SELinux policies, overlays, and init scripts have been directly generated and verified against physical hardware (`X6815C`, Serial: `09424252CN004968`) and official stock firmware (`X6815C-FW-V345`).

---

## Device Specifications

| Feature | Specification |
| :--- | :--- |
| **Model** | Infinix Zero 5G 2023 (`X6815C`) |
| **SoC** | MediaTek Dimensity 1080 / MT6877 (6 nm) |
| **CPU** | Octa-core (2x2.6 GHz Cortex-A78 & 6x2.0 GHz Cortex-A55) |
| **GPU** | ARM Mali-G68 MC4 |
| **RAM** | 8 GB LPDDR4X |
| **Storage** | 256 GB UFS 2.2 (expandable via dedicated microSDXC slot) |
| **Battery** | 5000 mAh Li-Po, 33W Fast Charging |
| **Display** | 6.78-inch IPS LCD, 1080 x 2460 pixels (20.5:9, 480 dpi), 120Hz refresh rate |
| **Rear Cameras** | 50 MP f/1.6 (Samsung S5KJN1, wide, PDAF) + 2 MP (macro) + 2 MP (depth) |
| **Front Camera** | 16 MP f/2.0 (wide) with front dual-LED flash |
| **Audio** | Dual speakers, 3.5mm headphone jack, 24-bit/192kHz Hi-Res audio |
| **Connectivity** | Wi-Fi 6 (802.11 a/b/g/n/ac/ax), Bluetooth 5.2, GPS, Dual-SIM (5G SA/NSA) |
| **Sensors** | Side-mounted fingerprint (power button), accelerometer, gyro, proximity, compass |
| **Shipped Android**| Android 12 (XOS 12) |

---

## Repository Ecosystem

This device tree works in conjunction with the corresponding vendor and kernel repositories:

| Component | Repository | Branch | Description |
| :--- | :--- | :--- | :--- |
| **Device Tree** | [`android_device_infinix_X6815C`](https://github.com/rag12ghu-design/android_device_infinix_X6815C) | `lineage-22.2` | Core device configuration, overlays, sepolicy, init scripts |
| **Vendor Tree** | [`android_vendor_infinix_X6815C`](https://github.com/rag12ghu-design/android_vendor_infinix_X6815C) | `lineage-22.2` | 2,561 proprietary binaries & HALs dumped from live hardware |
| **Kernel Tree** | [`android_device_infinix_X6815C-kernel`](https://github.com/rag12ghu-design/android_device_infinix_X6815C-kernel) | `lineage-22.2` | Stock `Image.gz` (Linux 4.19.191+) + 15 live hardware `.ko` modules |

---

## Hardware Grounding & Verification

* **Stock Firmware Baseline:** Extracted from official firmware build `X6815C-FW-V345` using `aospdtgen` and EROFS extraction tools.
* **Proprietary Vendor Blobs:** Direct live hardware dump from `/vendor` and `/system/vendor` via root ADB on physical test unit `09424252CN004968`.
* **Kernel & Modules:** Stock Linux 4.19.191+ `Image.gz` (MediaTek MT6877, Boot Header v2) verified alongside all active in-tree touchscreen, display, and peripheral kernel modules.
* **Device Isolation:** Completely purged of any cross-variant (`X6815D`) artifacts to ensure 100% hardware fidelity.

---

## Building LineageOS 22.2

### 1. Initialize LineageOS Source

```bash
mkdir -p ~/android/lineage && cd ~/android/lineage
repo init -u https://github.com/LineageOS/android.git -b lineage-22.2 --git-lfs
repo sync -c -j$(nproc --all) --force-sync --no-clone-bundle --no-tags
```

### 2. Clone Repositories

Create a local manifest in `.repo/local_manifests/x6815c.xml`:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<manifest>
  <project name="rag12ghu-design/android_device_infinix_X6815C" path="device/infinix/X6815C" remote="github" revision="lineage-22.2" />
  <project name="rag12ghu-design/android_vendor_infinix_X6815C" path="vendor/infinix/X6815C" remote="github" revision="lineage-22.2" />
  <project name="rag12ghu-design/android_device_infinix_X6815C-kernel" path="kernel/infinix/X6815C" remote="github" revision="lineage-22.2" />
</manifest>
```

Sync local projects:
```bash
repo sync -j$(nproc --all)
```

### 3. Build

```bash
source build/envsetup.sh
lunch lineage_X6815C-userdebug
mka bacon -j$(nproc --all)
```

---

## License

* Device tree configuration: [Apache License, Version 2.0](http://www.apache.org/licenses/LICENSE-2.0)
* Android Open Source Project & LineageOS Project.