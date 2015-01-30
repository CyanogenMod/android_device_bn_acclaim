#!/system/bin/sh

mount /bootdata

# Zero out the boot counter
dd if=/dev/zero of=/bootdata/BootCnt bs=1 count=4

# Reset the bootloader control block (bcb) file
dd if=/dev/zero of=/bootdata/BCB bs=1 count=1088

umount /bootdata

