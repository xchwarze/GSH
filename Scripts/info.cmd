@echo off
echo [*]Waiting for device
ADB\adb.exe wait-for-device
echo [*]Show Manufacturer
ADB\adb.exe shell getprop ro.product.manufacturer
echo [*]Show Name
ADB\adb.exe shell getprop ro.product.name
echo [*]Show Model
ADB\adb.exe shell getprop ro.product.model
echo [*]Show Android version
ADB\adb.exe shell getprop ro.build.version.release
echo [*]Show Platform
ADB\adb.exe shell getprop ro.board.platform
echo [*]Show CPU
ADB\adb.exe shell getprop ro.product.cpu.abi
echo [*]Show Description
ADB\adb.exe shell getprop ro.build.description
echo [*]Show Fingerprint
ADB\adb.exe shell getprop ro.build.fingerprint
echo [*]Show Flexversion
ADB\adb.exe shell getprop ro.gsm.flexversion

ADB\adb.exe kill-server