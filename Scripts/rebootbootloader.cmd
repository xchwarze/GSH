@echo off
echo [*]Waiting for device
ADB\adb.exe wait-for-device
echo [*]Bootloader
ADB\adb.exe reboot bootloader

ADB\adb.exe kill-server