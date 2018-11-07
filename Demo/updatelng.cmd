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

echo Updating LNG files for the TestDll library
..\kdlscan.exe TestDLL.dll

del TestDll.english.lng.bak
copy TestDll.english.lng TestDll.english.lng.bak
..\lngupdate.exe TestDll.english.lng TestDll.lng -! -x

del TestDll.russian.lng.bak
copy TestDll.russian.lng TestDll.russian.lng.bak
..\lngupdate.exe TestDll.russian.lng TestDll.lng -! -x

del TestDll.belarusian.lng.bak
ren TestDll.belarusian.lng TestDll.belarusian.lng.bak
ren TestDll.lng TestDll.belarusian.lng

echo Updating LNG files for the TestPackage package
..\kdlscan.exe TestPackage.bpl

del TestPackage.english.lng.bak
copy TestPackage.english.lng TestPackage.english.lng.bak
..\lngupdate.exe TestPackage.english.lng TestPackage.lng -! -x

del TestPackage.russian.lng.bak
copy TestPackage.russian.lng TestPackage.russian.lng.bak
..\lngupdate.exe TestPackage.russian.lng TestPackage.lng -! -x

del TestPackage.belarusian.lng.bak
ren TestPackage.belarusian.lng TestPackage.belarusian.lng.bak
ren TestPackage.lng TestPackage.belarusian.lng

pause
@echo on