@echo off
echo [*]Waiting for device
ADB\adb.exe wait-for-device
echo [*]Show all Props
ADB\adb.exe shell getprop 

ADB\adb.exe kill-server