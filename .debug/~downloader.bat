@echo off
setlocal enabledelayedexpansion
pushd "%~dp0"
cd ..
set files=%CD%\.debug\~environment_files.txt
set dirs=%CD%\.debug\~folders.txt
set filesurl=https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/.debug/~environment_files.txt
set dirsurl=https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/.debug/~folders.txt
bitsadmin.exe /transfer "DownloadFolderList" %dirsurl% "%dirs%"
bitsadmin.exe /transfer "DownloadFilesList" %filesurl% "%files%"
bitsadmin.exe /transfer "DownloadRUN" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/RUN.bat "%CD%\RUN.bat"
for /f %%a in ('type "%files%"') do (
	set current="%CD%\%%a"
	if exist !current! (
		del !current!
	)
)
for /f %%a in ('type "%dirs%"') do (
	set currentfolder="%CD%\%%a"
	if exist !currentfolder! (
		rd /S /Q !currentfolder!
	)
)
for /f %%a in ('type "%dirs%"') do (
	set currentfolder="%CD%\%%a"
	md !currentfolder!
)
set prefix=https://raw.githubusercontent.com/STOCD/SETS/main/
for /f %%a in ('type "%files%"') do (
	set targetpath="%CD%\%%a"
	set url=%%a
	set url=%prefix%!url:\=/!
	bitsadmin.exe /transfer "Downloading..." !url! !targetpath!
)
cls
echo SUCCESS
pause
