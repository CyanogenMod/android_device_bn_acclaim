#!/system/bin/sh

ORIG_NVS_BIN=/system/etc/firmware/ti-connectivity/wl1271-nvs_127x.bin
NVS_BIN=/system/etc/firmware/ti-connectivity/wl1271-nvs.bin

if [ ! -f "$NVS_BIN" ]; then
    mount -o remount,rw /system
    cp ${ORIG_NVS_BIN} ${NVS_BIN}
    MAC=`cat /rom/devconf/MACAddress | sed 's/\(..\)\(..\)\(..\)\(..\)\(..\)/\1:\2:\3:\4:\5:/'`
    calibrator set nvs_mac $NVS_BIN $MAC
    mount -o remount,ro /system
fi

insmod /system/lib/modules/wl12xx_sdio.ko
