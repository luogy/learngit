@echo off
call adb_connect.bat
adb -s %ip%:5555 install ..\application\ExoPlayer.apk
adb -s %ip%:5555 shell am start com.google.android.exoplayer.demo/.SampleChooserActivity