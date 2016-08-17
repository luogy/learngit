@echo off
call adb_connect.bat
echo ======== Remount %ip% /factory_setting ========
adb -s %ip%:5555 shell mount -o remount,rw /factory_setting
echo ======== Push key ========
adb -s %ip%:5555 push ..\Key_20150312 /factory_setting/
echo ======== Change key permission ========
adb -s %ip%:5555 shell chmod 777 /factory_setting/*