@echo off
echo [*]WAITING FOR DEVICE
ADB\adb.exe wait-for-device
echo [*]TESTING FOR SU PERMISSIONS
echo  MAKE SURE THAT THE SCREEN IS UNLOCKED 
echo  and if you get Superuser prompts ACCEPT/ALLOW THEM 
echo  ELSE THIS WILL NOT WORK
ADB\adb.exe shell "su -c 'echo [*]Superuser check successful'"
echo [*]cleaning
ADB\adb.exe shell "cd /data/local/tmp/; rm *"
echo [*]pushing busybox
ADB\adb.exe push Dependencies\busybox /data/local/tmp/.
echo [*]correcting permissions
ADB\adb.exe shell "chmod 755 /data/local/tmp/busybox"
echo [*]remounting /system
echo  MAKE SURE THAT THE SCREEN IS UNLOCKED 
echo  and if you get Superuser prompts ACCEPT/ALLOW THEM 
echo  ELSE THIS WILL NOT WORK
ADB\adb.exe shell "su -c '/data/local/tmp/busybox mount -o remount,rw /system'"
echo [*]pushing unroot script
ADB\adb.exe push Root\unroot /data/local/tmp/.
echo [*]correcting permissions
ADB\adb.exe shell "chmod 777 /data/local/tmp/unroot"
echo [*]executing unroot
echo  MAKE SURE THAT THE SCREEN IS UNLOCKED 
echo  and if you get Superuser prompts ACCEPT/ALLOW THEM 
echo  ELSE THIS WILL NOT WORK
ADB\adb.exe shell "su -c '/data/local/tmp/unroot'"
echo [*]cleaning
ADB\adb.exe shell "cd /data/local/tmp/; rm *"
echo [*]rebooting
ADB\adb.exe reboot