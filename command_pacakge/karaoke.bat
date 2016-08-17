@echo off
call adb_connect.bat
echo ======== Remount %ip% /system ========
adb -s %ip%:5555 remount
echo ======== Push cxdish ========
adb -s %ip%:5555 push ..\Karaoke_20140611\conexant_file\cxdish /system/vendor/bin/
echo ======== Change cxdish permission ========
adb -s %ip%:5555 shell chmod 777 /system/vendor/bin/cxdish
echo ======== Push iflash.bin ========
adb -s %ip%:5555 push ..\Karaoke_20140611\conexant_file\iflash.bin /data/
echo ======== Change iflash.bin permission ========
adb -s %ip%:5555 shell chmod 777 /data/iflash.bin
echo ======== Push lg-stb-4.93.5.0.sfs ========
adb -s %ip%:5555 push ..\Karaoke_20140611\conexant_file\lg-stb-4.93.5.0.sfs /data/
echo ======== Change lg-stb-4.93.5.0.sfs permission ========
adb -s %ip%:5555 shell chmod 777 /data/lg-stb-4.93.5.0.sfs
echo ======== Install Karaoke ========
adb -s %ip%:5555 shell cxdish flash /data/lg-stb-4.93.5.0.sfs /data/iflash.bin
adb -s %ip%:5555 shell cxdish -r
adb -s %ip%:5555 shell cxdish sendcmd 0xb32d2300 0x00000004 0x87286b00
adb -s %ip%:5555 shell cxdish sendcmd 0xd3086331 0x00000040 0x01800000 0x01800000
adb -s %ip%:5555 shell ampsamples_uplus 24 0 0 100