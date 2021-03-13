@echo off
title fahmiyufrizal@2021
color 00


call :isAdmin

if %errorlevel% == 0 (
    goto :run
) else (
    echo fahmiyufrizal@2021...
	echo Script Starting....
    goto :UACPrompt
)

exit /b

:isAdmin
    fsutil dirty query %systemdrive% >nul
exit /b

:run
pushd %~dp0
taskkill /f /im AndroidEmulator.exe /im adb.exe /im AppMarket.exe /im QMEmulatorService.exe /im aow_exe.exe /im syzs_dl_svr.exe /im TitanService.exe|find ":" > nul
net stop "aow_drv"
rd C:\Temp /s /q
taskkill /f /im AndroidEmulator.exe /im adb.exe /im AppMarket.exe /im QMEmulatorService.exe /im aow_exe.exe /im syzs_dl_svr.exe /im TitanService.exe|find ":" > nul
%SystemRoot%\System32\reg.exe delete HKEY_CURRENT_USER\SOFTWARE\Tencent\ /f
%SystemRoot%\System32\reg.exe delete HKEY_LOCAL_MACHINE\SOFTWARE\Classes\TencentMobileGameAssistant /f
%SystemRoot%\System32\reg.exe delete HKEY_LOCAL_MACHINE\SOFTWARE\Tencent /f
%SystemRoot%\System32\reg.exe delete HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Tencent /f
cd ..
start "" "TGB Portable.exe"
exit /b

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    echo UAC.ShellExecute "cmd.exe", "/c %~s0 %~1", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
exit /B