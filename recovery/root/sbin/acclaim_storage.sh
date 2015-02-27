#!/sbin/sh
echo "running acclaim_storage.sh" > /dev/kmsg
if [ -e /dev/block/mmcblk0p11 ];
then
	echo "acclaim_storage p11 is present" > /dev/kmsg
	mount -t auto /dev/block/mmcblk0p8 /system
	if [ "$(grep ro.emulated_storage /system/build.prop)" ];
	then
		# Is using unified storage with p11 present
		echo "acclaim_storage using regularunified" > /dev/kmsg
		cp /etc/twrp.fstab.regularunified /etc/twrp.fstab
	else
		# No unified storage
		echo "acclaim_storage using splitstorage" > /dev/kmsg
		cp /etc/twrp.fstab.splitstorage /etc/twrp.fstab
	fi
	umount /system
else
	# No p11 means that we must be using unified storage
	echo "acclaim_storage using unifiedp10" > /dev/kmsg
	cp /etc/twrp.fstab.unifiedp10 /etc/twrp.fstab
fi
