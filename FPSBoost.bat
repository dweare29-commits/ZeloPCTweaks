@echo off
:: =============================
:: Zelo PC Optimization Tweaks Pack - Advanced Edition
:: =============================

:: Background black, main text white
color 07

:menu
cls
:: Purple header
color 05
echo ================================
echo       Zelo PC Optimization Tweaks
echo ================================
color 07
echo.
echo 1. Clean Temporary Files
echo 2. Flush DNS Cache
echo 3. Restart Explorer
echo 4. High Performance Power Plan
echo 5. Disable Windows Animations
echo 6. Clear Prefetch & Superfetch
echo 7. Disable Xbox Game Bar & Game DVR
echo 8. Disable Startup Programs
echo 9. Adjust Visual Effects for Performance
echo 10. Temporarily Disable Search Indexing
echo 11. Exit
echo.
set /p choice=Choose an option (1-11): 

if "%choice%"=="1" goto cleanup
if "%choice%"=="2" goto flushdns
if "%choice%"=="3" goto restartexplorer
if "%choice%"=="4" goto highperf
if "%choice%"=="5" goto disableanimations
if "%choice%"=="6" goto clearprefetch
if "%choice%"=="7" goto disablexbox
if "%choice%"=="8" goto disablestartup
if "%choice%"=="9" goto visualeffects
if "%choice%"=="10" goto disablesearch
if "%choice%"=="11" exit
goto menu

:: ------------------------------
:cleanup
echo Cleaning temporary files...
del /s /q %temp%\*
del /s /q C:\Windows\Temp\*
echo Done!
pause
goto menu

:flushdns
ipconfig /flushdns
echo DNS cache cleared!
pause
goto menu

:restartexplorer
taskkill /f /im explorer.exe
start explorer.exe
echo Explorer restarted!
pause
goto menu

:highperf
echo Setting High Performance power plan...
powercfg -setactive SCHEME_MIN
echo Done! PC is now on High Performance mode.
pause
goto menu

:disableanimations
echo Disabling Windows animations...
reg add "HKCU\Control Panel\Desktop\WindowMetrics" /v MinAnimate /t REG_SZ /d 0 /f
reg add "HKCU\Control Panel\Desktop" /v UserPreferencesMask /t REG_BINARY /d 9012018010000000 /f
taskkill /f /im explorer.exe
start explorer.exe
echo Animations disabled!
pause
goto menu

:clearprefetch
echo Clearing Prefetch and Superfetch...
del /s /q C:\Windows\Prefetch\*
sc stop SysMain
echo Done!
pause
goto menu

:disablexbox
echo Disabling Xbox Game Bar and Game DVR...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\GameDVR" /v AppCaptureEnabled /t REG_DWORD /d 0 /f
reg add "HKCU\System\GameConfigStore" /v GameDVR_Enabled /t REG_DWORD /d 0 /f
echo Done!
pause
goto menu

:disablestartup
echo Disabling common startup programs...
:: List of common startup apps (users can adjust)
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v OneDrive /t REG_SZ /d "" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Run" /v Spotify /t REG_SZ /d "" /f
echo Startup programs disabled!
pause
goto menu

:visualeffects
echo Adjusting Visual Effects for best performance...
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v VisualFXSetting /t REG_DWORD /d 2 /f
echo Done!
pause
goto menu

:disablesearch
echo Temporarily disabling Windows Search Indexing...
net stop WSearch
echo Done! Indexing paused until next reboot.
pause
goto menu
