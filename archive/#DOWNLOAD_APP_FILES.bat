@echo off
setlocal enabledelayedexpansion
pushd "%~dp0"
set files=%CD%\..debug\~app_files.txt
set prefix=https://raw.githubusercontent.com/STOCD/SETS/main/
for /f %%a in ('type "%files%"') do (
	set targetpath="%CD%\%%a"
	set url=%%a
	set url=%prefix%!url:\=/!
	bitsadmin.exe /transfer "Downloading..." !url! !targetpath!
)
cls
echo [%date%]-[%time%] -- App files successfully downloaded >> "%CD%\..debug\log.txt
echo [%date%]-[%time%] -- App files successfully downloaded
pause
