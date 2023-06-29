@echo off
pushd "%~dp0"
@echo on
python "%CD%\main.py" --configfolder "%CD%\.config"
