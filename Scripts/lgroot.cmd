@echo off
echo [*]Waiting for device
ADB\adb.exe wait-for-device
echo [*]Patching ADB (LG Device)
ADB\adb.exe shell "echo 1 > /data/local/lge_adb.conf"
echo [*]rebooting
ADB\adb.exe reboot
ADB\adb.exe kill-server