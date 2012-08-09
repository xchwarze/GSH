@echo off
echo [*]Waiting for device
ADB\adb.exe wait-for-device
echo [*]Recovery
ADB\adb.exe reboot recovery

ADB\adb.exe kill-server