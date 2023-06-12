@echo off
pushd "%~dp0"
cd..
python "%CD%\src\PreApp\snapshot.py" >> "%CD%\.debug\snapshot-output.txt"
echo [%date%]-[%time%] -- Snapshot complete! >> "%CD%\.debug\log.txt"
echo [%date%]-[%time%] -- Snapshot complete!
pause