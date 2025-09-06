@echo off
title Zelo Ultimate Optimization Bundle
color 0F

:: Set up colors
set "purple=0D"

echo.
echo ==================================================
echo         %purple%Zelo PC Ultimate Optimization Bundle
echo ==================================================
echo.
echo  [1] Apply Full FPS Boost
echo  [2] Memory Cleanup
echo  [3] Disable Background Services (Gaming Mode)
echo  [4] Apply High Performance Power Plan
echo  [5] Run Quick Disk Cleanup
echo  [6] Apply ALL Tweaks (Recommended)
echo  [7] Exit
echo.
set /p choice="Select an option: "

if "%choice%"=="1" goto fps
if "%choice%"=="2" goto memory
if "%choice%"=="3" goto services
if "%choice%"=="4" goto power
if "%choice%"=="5" goto disk
if "%choice%"=="6" goto all
if "%choice%"=="7" exit

:fps
echo Applying FPS Boost...
:: Example tweak - disable full screen optimizations
reg add "HKCU\System\GameConfigStore" /v GameDVR_FSEBehaviorMode /t REG_DWORD /d 2 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\GameDVR" /v AllowGameDVR /t REG_DWORD /d 0 /f
echo FPS Boost applied!
pause
goto end

:memory
echo Cleaning memory...
:: Flush DNS cache
ipconfig /flushdns
:: Empty standby list (requires RAMMap or other advanced tools)
echo (Optional: For deeper memory cleaning, use Sysinternals RAMMap.)
echo Memory cleanup done!
pause
goto end

:services
echo Disabling unnecessary background services for Gaming...
sc stop "DiagTrack" >nul 2>&1
sc config "DiagTrack" start=disabled >nul 2>&1
sc stop "SysMain" >nul 2>&1
sc config "SysMain" start=disabled >nul 2>&1
sc stop "WSearch" >nul 2>&1
sc config "WSearch" start=disabled >nul 2>&1
echo Background services minimized!
pause
goto end

:power
echo Applying High Performance Power Plan...
powercfg -setactive SCHEME_MIN
echo High Performance power plan applied!
pause
goto end

:disk
echo Running Disk Cleanup...
cleanmgr /sagerun:1
echo Disk cleanup completed!
pause
goto end

:all
echo Applying ALL tweaks...
call :fps
call :memory
call :services
call :power
call :disk
echo All tweaks applied!
pause
goto end

:end
cls
echo Done! Thank you for using Zelo Ultimate Bundle.
pause
exit
