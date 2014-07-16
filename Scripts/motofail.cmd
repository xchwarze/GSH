@echo off
echo [*]Waiting for device
ADB\adb.exe wait-for-device
echo [*]Device found.
echo [*]Deploying payload...
ADB\adb.exe push Exploits\motofail /data/local/motofail
ADB\adb.exe shell "chmod 755 /data/local/motofail"
echo [*]Owning phone...
ADB\adb.exe shell "/data/local/motofail exploit"
echo [*]Rebooting device...
ADB\adb.exe reboot
echo [*]Waiting for phone to reboot.
ADB\adb.exe wait-for-device
echo [*]Attemping persistence...
ADB\adb.exe remount
ADB\adb.exe push Root\su-v3 /system/bin/su
ADB\adb.exe shell "chmod 6755 /system/bin/su"
ADB\adb.exe shell "ln -s /system/bin/su /system/xbin/su"
ADB\adb.exe push Dependencies\busybox /system/xbin/busybox
ADB\adb.exe shell "chmod 755 /system/xbin/busybox"
ADB\adb.exe shell "/system/xbin/busybox --install /system/xbin"
ADB\adb.exe push Root\Superuser.apk /system/app/Superuser.apk
echo [*]Cleaning up...
ADB\adb.exe shell "/data/local/motofail clean"
ADB\adb.exe shell "rm /data/local/motofail"
echo [*]Rebooting...
ADB\adb.exe reboot
ADB\adb.exe wait-for-device
echo [*]Exploit complete!
ADB\adb.exe kill-server