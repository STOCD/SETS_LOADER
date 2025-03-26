@echo off
pushd "%~dp0"
cd ..
@echo on
python "%CD%\main.py" --configfolder "%CD%\.config"
pause
