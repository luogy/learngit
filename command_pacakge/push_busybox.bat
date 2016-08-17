@echo off
call adb_connect.bat
echo Remount %ip% /system
adb -s %ip%:5555 remount
echo Push busybox
adb -s %ip%:5555 push ..\binary\busybox /system/vendor/bin/
echo Change busybox permission
adb -s %ip%:5555 shell chmod 777 /system/vendor/bin/busybox