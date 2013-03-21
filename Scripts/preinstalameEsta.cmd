@echo off
echo Waiting for Phone...
echo.
ADB\adb.exe wait-for-device
ADB\adb.exe devices
ADB\adb.exe push preinstalameEsta\rooted.prop /data/preinstall_md5/
ADB\adb.exe push preinstalameEsta\root.sh /data/preinstall_md5/
ADB\adb.exe shell "ln -s /sys/kernel/uevent_helper /data/preinstall_md5/first.md5"
ADB\adb.exe shell "ln -s /sys/class/mem/null/uevent /data/preinstall_md5/second.md5"
ADB\adb.exe shell "chmod 777 /data/preinstall_md5/root.sh"
echo.
echo Without closing this window, shutdown the phone
echo and restart it in bootloader mode (power + UP key in the keyboard)
echo Once inside the bootloader mode, flash the preinstalameEsta\fixed.sbf from rsdlite
echo after it restarts, enable USB debugging and press enter to continue...
pause > nul
echo.
echo Waiting for Phone...
echo.
ADB\adb.exe wait-for-device
ADB\adb.exe shell "echo 'doing something on adb, otherwise it does not work'"
ADB\adb.exe reboot
ADB\adb.exe wait-for-device
ADB\adb.exe remount
ADB\adb.exe push Root\su-v2 /system/bin/su
ADB\adb.exe shell "chmod 6755 /system/bin/su"
ADB\adb.exe shell "ln -s /system/bin/su /system/xbin/su"
ADB\adb.exe push Dependencies\busybox /system/xbin/busybox
ADB\adb.exe shell "chmod 755 /system/xbin/busybox"
ADB\adb.exe shell "/system/xbin/busybox --install /system/xbin"
ADB\adb.exe push Root\Superuser.apk /system/app/Superuser.apk
ADB\adb.exe shell "rm /data/preinstall_md5/*"
ADB\adb.exe shell "echo '/sbin/hotplug > /sys/kernel/uevent_helper'"
ADB\adb.exe reboot
ADB\adb.exe wait-for-device
ADB\adb.exe kill-server
echo.
echo The End!