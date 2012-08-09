@echo off
echo [*]Waiting for device
ADB\adb.exe wait-for-device
echo [*]Creating temporary directory
ADB\adb.exe shell "cd /data/local && mkdir tmp"
echo [*]Cleaning
ADB\adb.exe shell "cd /data/local/tmp/ && rm *"
echo [*]Pushing zergRush
ADB\adb.exe push Exploits\zergRush /data/local/tmp/.
echo [*]Correcting permissions
ADB\adb.exe shell "chmod 777 /data/local/tmp/zergRush"
echo [*]Executing zergRush
ADB\adb.exe shell "./data/local/tmp/zergRush"
echo [*]Waiting for device to reconnect
echo if it gets stuck over here for a long time then try:
echo    disconnect usb cable and reconnect it
echo    toggle "USB DEBUGGING" (first disable it then enable it)
ADB\adb.exe wait-for-device
echo [*]Device found
echo [*]Pushing busybox
ADB\adb.exe push Dependencies\busybox /data/local/tmp/.
echo [*]Correcting permissions
ADB\adb.exe shell "chmod 755 /data/local/tmp/busybox"
echo [*]Remounting /system
ADB\adb.exe shell "/data/local/tmp/busybox mount -o remount,rw /system"
echo [*]Checking free space on /system
ADB\adb.exe push Dependencies\makespace /data/local/tmp/.
ADB\adb.exe shell "chmod 777 /data/local/tmp/makespace"
ADB\adb.exe shell "./data/local/tmp/makespace"
echo [*]Copying busybox to /system/xbin/
ADB\adb.exe shell "dd if=/data/local/tmp/busybox of=/system/xbin/busybox"
echo [*]Correcting ownership
ADB\adb.exe shell "chown root.shell /system/xbin/busybox"
echo [*]Correcting permissions
ADB\adb.exe shell "chmod 04755 /system/xbin/busybox"
echo [*]Installing busybox
ADB\adb.exe shell "/system/xbin/busybox --install -s /system/xbin"
ADB\adb.exe shell "rm -r /data/local/tmp/busybox"
echo [*]Pushing SU binary
ADB\adb.exe push Root\su-v2 /system/bin/su
echo [*]Correcting ownership
ADB\adb.exe shell "chown root.shell /system/bin/su"
echo [*]Correcting permissions
ADB\adb.exe shell "chmod 06755 /system/bin/su"
echo [*]Porrecting symlinks
ADB\adb.exe shell "rm /system/xbin/su"
ADB\adb.exe shell "ln -s /system/bin/su /system/xbin/su"
echo [*]Pushing Superuser app
ADB\adb.exe push Root\Superuser.apk /system/app/.
echo [*]Cleaning
ADB\adb.exe shell "cd /data/local/tmp/; rm *"
echo [*]Rebooting
ADB\adb.exe reboot
ADB\adb.exe kill-server