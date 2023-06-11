pushd "%~dp0"
bitsadmin.exe /transfer "DownloadCurrentVersion" https://raw.githubusercontent.com/STOCD/SETS/main/main.py "%CD%\main.py"
echo [%date%]-[%time%] -- File download complete! >> "%CD%\debug\log.txt"
python "%CD%\main.py"
