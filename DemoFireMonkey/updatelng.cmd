@echo off
echo Updating LNG files for the TestApp application
..\kdlscan.exe TestApp

del TestApp.english.lng.bak
copy TestApp.english.lng TestApp.english.lng.bak
..\lngupdate.exe TestApp.english.lng TestApp.lng -! -x

del TestApp.russian.lng.bak
copy TestApp.russian.lng TestApp.russian.lng.bak
..\lngupdate.exe TestApp.russian.lng TestApp.lng -! -x

del TestApp.belarusian.lng.bak
ren TestApp.belarusian.lng TestApp.belarusian.lng.bak
ren TestApp.lng TestApp.belarusian.lng

pause
@echo on