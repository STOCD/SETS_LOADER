@echo off
setlocal enabledelayedexpansion
pushd "%~dp0"
cd ..
set files=%CD%\environment_files.txt
for /f %%a in ('type "%files%"') do (
	set current="%CD%\%%a"
	if exist !current! (
		del !current!
	)
)
set dirs=%CD%\folders.txt
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
pause
