@echo off
set PATH=%PATH%;%~dp0..\adb_tools\
set /p ip=<IP.txt
echo Set %ip%
echo Try adb connect
adb -s %ip%:5555 shell exit 2> nul
adb connect %ip%