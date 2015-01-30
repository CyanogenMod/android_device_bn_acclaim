# Copyright (C) 2013 The CyanogenMod Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

DEVICE_FOLDER := device/bn/acclaim
COMMON_FOLDER := device/bn/omap4-common

$(call inherit-product, $(COMMON_FOLDER)/common.mk)

DEVICE_PACKAGE_OVERLAYS += $(DEVICE_FOLDER)/overlay/aosp

# rootfs
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/root/init.acclaim.rc:root/init.acclaim.rc \
	$(DEVICE_FOLDER)/recovery/init.recovery.acclaim.rc:root/init.recovery.acclaim.rc \
	$(DEVICE_FOLDER)/root/init.acclaim.usb.rc:root/init.acclaim.usb.rc \
	$(DEVICE_FOLDER)/root/ueventd.acclaim.rc:root/ueventd.acclaim.rc \
	$(DEVICE_FOLDER)/root/fstab.acclaim:root/fstab.acclaim

# media
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/audio_policy.conf:/system/etc/audio_policy.conf \
	$(DEVICE_FOLDER)/prebuilt/etc/media_codecs.xml:/system/etc/media_codecs.xml \
	$(DEVICE_FOLDER)/prebuilt/etc/media_profiles.xml:system/etc/media_profiles.xml \
	frameworks/av/media/libstagefright/data/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
	frameworks/av/media/libstagefright/data/media_codecs_google_video.xml:system/etc/media_codecs_google_video.xml

# art
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/poetry/poem.txt:root/sbin/poem.txt

# input
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/usr/idc/ft5x06-i2c.idc:system/usr/idc/ft5x06-i2c.idc \
	$(DEVICE_FOLDER)/prebuilt/usr/keylayout/gpio-keys.kl:system/usr/keylayout/gpio-keys.kl

# location fix
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/etc/gps.conf:/system/etc/gps.conf

# wifi
PRODUCT_PACKAGES += \
	127x_TQS_S_2.6.ini \
	calibrator \
	crda \
	dhcpcd.conf \
	hostapd \
	hostapd.conf \
	lib_driver_cmd_wl12xx \
	regulatory.bin \
	wpa_supplicant \
	wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/prebuilt/etc/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf

# misc scripts
PRODUCT_COPY_FILES += \
	$(DEVICE_FOLDER)/prebuilt/bin/clearbootdata.sh:root/sbin/clearbootdata.sh \
	$(DEVICE_FOLDER)/prebuilt/bin/log_battery_data.sh:/system/bin/log_battery_data.sh \
	$(DEVICE_FOLDER)/prebuilt/bin/fix-mac.sh:/system/bin/fix-mac.sh \

# hardware HALs
PRODUCT_PACKAGES += \
	hwcomposer.acclaim \
	lights.acclaim \
	power.acclaim \
	sensors.acclaim \
	audio.primary.acclaim

PRODUCT_PACKAGES += \
	libjni_pinyinime \
	libwvm \
	TFF \
	setup_fs \
	tinyplay \
	tinymix \
	tinycap

# TI OMAP4
PRODUCT_PACKAGES += \
	libdomx \
	libOMX_Core \
	libOMX.TI.DUCATI1.VIDEO.H264E \
	libOMX.TI.DUCATI1.VIDEO.MPEG4E \
	libOMX.TI.DUCATI1.VIDEO.DECODER \
	libOMX.TI.DUCATI1.VIDEO.DECODER.secure \
	libOMX.TI.DUCATI1.VIDEO.CAMERA \
	libOMX.TI.DUCATI1.MISC.SAMPLE \
	libstagefrighthw \
	libI420colorconvert \
	libtiutils \
	libcamera \
	libion_ti \
	libomxcameraadapter \
	smc_pa_ctrl \
	tf_daemon \
	libtf_crypto_sst

PRODUCT_CHARACTERISTICS := tablet
PRODUCT_AAPT_CONFIG := normal mdpi hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := mdpi

PRODUCT_PROPERTY_OVERRIDES += \
	omap.audio.mic.main=AMic0 \
	omap.audio.mic.sub=AMic1 \
	omap.audio.power=PingPong \
	ro.carrier=wifi-only \
	ro.sf.lcd_density=160

$(call inherit-product, vendor/bn/acclaim/acclaim-vendor.mk)
$(call inherit-product, frameworks/native/build/tablet-7in-hdpi-1024-dalvik-heap.mk)
$(call inherit-product, hardware/ti/wlan/mac80211/wl127x-wlan-products.mk)
