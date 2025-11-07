@echo off
chcp 65001 > nul
title DG PC/Phone Information

:: §£§í§Ò§à§â §ñ§Ù§í§Ü§Ñ
cls
echo Select language / §£§í§Ò§Ö§â§Ú§ä§Ö §ñ§Ù§í§Ü:
echo 1. Russian
echo 2. English
choice /C 12 /N /T 10 /D 1
set LANG_CHOICE=%ERRORLEVEL%

if "%LANG_CHOICE%"=="1" goto RU_INFO
if "%LANG_CHOICE%"=="2" goto EN_INFO

:: §ª§ß§ä§Ö§â§æ§Ö§Û§ã §ß§Ñ §â§å§ã§ã§Ü§à§Þ §ñ§Ù§í§Ü§Ö
:RU_INFO
cls
echo §ª§ß§æ§à§â§Þ§Ñ§è§Ú§ñ §à §Ó§Ñ§ê§Ö§Þ §å§ã§ä§â§à§Û§ã§ä§Ó§Ö:
echo ---
echo §²§Ö§Ö§ã§ä§â §á§à §Ñ§Õ§â§Ö§ã§å HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion:
reg query HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion /s
echo ---
wmic computersystem get model,name,vendor,version | findstr /v VendorName ProductName
echo ---
wmic os get caption,version,builddate | more
echo ---
wmic cpu get name,maxclockspeed,numberofcores,numberoflogicalprocessors | more
echo ---
wmic memorychip get capacity,speed,type | more
echo ---
wmic path win32_videocontroller get description,pnpdeviceid,videoprocessor,resolutionx,resolutiony | more
echo ---
wmic bios get serialnumber | more
echo ---
wmic baseboard get product,serialnumber,version | more
echo ---
systeminfo | findstr /I /C:"System Type:"
echo ---
systeminfo | findstr /I /C:"Total Physical Memory:"
echo ---
systeminfo | findstr /I /C:"Virtual Memory:"
echo ---
powercfg /energy & powercfg /lastwake
echo ---
goto END

:: §ª§ß§ä§Ö§â§æ§Ö§Û§ã §ß§Ñ §Ñ§ß§Ô§Ý§Ú§Û§ã§Ü§à§Þ §ñ§Ù§í§Ü§Ö
:EN_INFO
cls
echo Device Information:
echo ---
echo Registry data from HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion:
reg query HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion /s
echo ---
wmic computersystem get model,name,vendor,version | findstr /v VendorName ProductName
echo ---
wmic os get caption,version,builddate | more
echo ---
wmic cpu get name,maxclockspeed,numberofcores,numberoflogicalprocessors | more
echo ---
wmic memorychip get capacity,speed,type | more
echo ---
wmic path win32_videocontroller get description,pnpdeviceid,videoprocessor,resolutionx,resolutiony | more
echo ---
wmic bios get serialnumber | more
echo ---
wmic baseboard get product,serialnumber,version | more
echo ---
systeminfo | findstr /I /C:"System Type:"
echo ---
systeminfo | findstr /I /C:"Total Physical Memory:"
echo ---
systeminfo | findstr /I /C:"Virtual Memory:"
echo ---
powercfg /energy & powercfg /lastwake
echo ---
goto END

:END
pause
exit /b