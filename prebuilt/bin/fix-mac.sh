#!/system/bin/sh

PATH=/sbin:/vendor/bin:/system/sbin:/system/bin:/system/xbin
ORIG_NVS_BIN=/system/etc/firmware/ti-connectivity/wl1271-nvs_127x.bin
NVS_BIN=/system/etc/firmware/ti-connectivity/wl1271-nvs.bin

if bbx [ ! -f "$NVS_BIN" ]; then
    toolbox mount -o remount,rw /system
    toolbox cp ${ORIG_NVS_BIN} ${NVS_BIN}
    MAC=`cat /rom/devconf/MACAddress | sed 's/\(..\)\(..\)\(..\)\(..\)\(..\)/\1:\2:\3:\4:\5:/'`
    calibrator set nvs_mac $NVS_BIN $MAC
    toolbox mount -o remount,ro /system
fi
