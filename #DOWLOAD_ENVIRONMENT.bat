@echo off
pushd "%~dp0"
set dfolder="%CD%\..debug\"
if exist %dfolder% (
	rd /S /Q %dfolder%
)
md %dfolder%
bitsadmin.exe /transfer "Download Downloader" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/~downloader.bat "%CD%\..debug\~downloader.bat"
call "%CD%\..debug\~downloader.bat"
