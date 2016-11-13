#!/sbin/sh

echo "Starting to repartition" > /tmp/repartition.log

echo "Before any modifications, sgdisk shows:" >> /tmp/repartition.log
sgdisk --print /dev/block/mmcblk0 >> /tmp/repartition.log 2>&1

echo "Attempting to delete old partition layout. Not an error if this does not succeed" >> /tmp/repartition.log
sgdisk --delete 11 /dev/block/mmcblk0 >> /tmp/repartition.log 2>&1

echo "Deleting partition userdata..." >> /tmp/repartition.log
sgdisk --delete 10 /dev/block/mmcblk0 >> /tmp/repartition.log 2>&1

echo "Deleting partition cache..." >> /tmp/repartition.log
sgdisk --delete 9 /dev/block/mmcblk0 >> /tmp/repartition.log 2>&1

echo "Deleting partition system..." >> /tmp/repartition.log
sgdisk --delete 8 /dev/block/mmcblk0 >> /tmp/repartition.log 2>&1

echo "Creating new partitions" >> /tmp/repartition.log
echo "Creating system" >> /tmp/repartition.log
sgdisk --new 0:0:+2G --change-name 8:system /dev/block/mmcblk0 >> /tmp/repartition.log 2>&1
echo "Creating cache" >> /tmp/repartition.log
sgdisk --new 0:0:+1G --change-name 9:cache /dev/block/mmcblk0 >> /tmp/repartition.log 2>&1
echo "Creating userdata" >> /tmp/repartition.log
sgdisk --new 0:0 --change-name 10:userdata /dev/block/mmcblk0 >> /tmp/repartition.log 2>&1

echo "After repartitioning, sgdisk shows:" >> /tmp/repartition.log
sgdisk --print /dev/block/mmcblk0 >> /tmp/repartition.log 2>&1

echo "Formatting partitions" >> /tmp/repartition.log
echo "Formatting system with ext4" >> /tmp/repartition.log
mkfs.ext4 /dev/block/mmcblk0p8 >> /tmp/repartition.log 2>&1
echo "Formatting cache with f2fs"  >> /tmp/repartition.log
mkfs.f2fs /dev/block/mmcblk0p9 >> /tmp/repartition.log 2>&1
echo "Formatting userdata with f2fs"  >> /tmp/repartition.log
mkfs.f2fs /dev/block/mmcblk0p10 >> /tmp/repartition.log 2>&1

echo "Done" >> /tmp/repartition.log 2>&1
