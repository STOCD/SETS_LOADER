@echo off
setlocal enabledelayedexpansion
pushd "%~dp0"
cd ..
set files=%CD%\..debug\~environment_files.txt
set dirs=%CD%\..debug\~folders.txt
set filesurl=https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/~environment_files.txt
set dirsurl=https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/~folders.txt
bitsadmin.exe /transfer "DownloadFolderList" %dirsurl% "%dirs%"
bitsadmin.exe /transfer "DownloadFilesList" %filesurl% "%files%"
bitsadmin.exe /transfer "DownloadAppFilesList" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/~app_files.txt "%CD%\..debug\~app_files.txt"
bitsadmin.exe /transfer "DownloadRUN" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/RUN.bat "%CD%\RUN.bat"
bitsadmin.exe /transfer "Download#SETUP" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/%%23SETUP.bat "%CD%\..debug\#SETUP.bat"
bitsadmin.exe /transfer "Download#RUN" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/%%23RUN.bat "%CD%\..debug\#RUN.bat"
bitsadmin.exe /transfer "Download#RUN-SNAPSHOT" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/%%23RUN-SNAPSHOT.bat "%CD%\..debug\#RUN-SNAPSHOT.bat"
bitsadmin.exe /transfer "Download#RELOAD-REQUIREMENTS" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/%%23RELOAD-REQUIREMENTS.bat "%CD%\..debug\#RELOAD-REQUIREMETNS.bat"
bitsadmin.exe /transfer "Download#UNINSTALL-REQUIREMENTS" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/%%23UNINSTALL-REQUIREMENTS.bat "%CD%\..debug\#UNINSTALL-REQUIREMENTS.bat"
bitsadmin.exe /transfer "Download#DOWNLOAD_APP_FILES" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/%%23DOWNLOAD_APP_FILES.bat "%CD%\#DOWNLOAD_APP_FILES.bat"
bitsadmin.exe /transfer "DownloadReadme" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/README.md "%CD%\README.txt"
bitsadmin.exe /transfer "Download.debug" https://raw.githubusercontent.com/STOCD/SETS_LOADER/main/..debug/.debug "%CD%\..debug\.debug"
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
echo SUCCESS DOWNLOADING ENVIRONMENT
echo:
echo [%date%]-[%time%] -- Environment files successfully downloaded >> "%CD%\..debug\log.txt
call ..debug\#SETUP.bat
