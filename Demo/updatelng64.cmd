@echo off
echo Updating LNG files for the TestApp64 application
..\kdlscan.exe TestApp64

del TestApp64.english.lng.bak
copy TestApp64.english.lng TestApp64.english.lng.bak
..\lngupdate.exe TestApp64.english.lng TestApp64.lng -! -x

del TestApp64.russian.lng.bak
copy TestApp64.russian.lng TestApp64.russian.lng.bak
..\lngupdate.exe TestApp64.russian.lng TestApp64.lng -! -x

del TestApp64.belarusian.lng.bak
ren TestApp64.belarusian.lng TestApp64.belarusian.lng.bak
ren TestApp64.lng TestApp64.belarusian.lng

echo Updating LNG files for the TestDll64 library
..\kdlscan.exe TestDll64.dll

del TestDll64.english.lng.bak
copy TestDll64.english.lng TestDll64.english.lng.bak
..\lngupdate.exe TestDll64.english.lng TestDll64.lng -! -x

del TestDll64.russian.lng.bak
copy TestDll64.russian.lng TestDll64.russian.lng.bak
..\lngupdate.exe TestDll64.russian.lng TestDll64.lng -! -x

del TestDll64.belarusian.lng.bak
ren TestDll64.belarusian.lng TestDll64.belarusian.lng.bak
ren TestDll64.lng TestDll64.belarusian.lng

echo Updating LNG files for the TestPackage64 package
..\kdlscan.exe TestPackage64.bpl

del TestPackage64.english.lng.bak
copy TestPackage64.english.lng TestPackage64.english.lng.bak
..\lngupdate.exe TestPackage64.english.lng TestPackage64.lng -! -x

del TestPackage64.russian.lng.bak
copy TestPackage64.russian.lng TestPackage64.russian.lng.bak
..\lngupdate.exe TestPackage64.russian.lng TestPackage64.lng -! -x

del TestPackage64.belarusian.lng.bak
ren TestPackage64.belarusian.lng TestPackage64.belarusian.lng.bak
ren TestPackage64.lng TestPackage64.belarusian.lng

pause
@echo on