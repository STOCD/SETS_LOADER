@echo off
pushd "%~dp0"
cd..
set setsdir=%CD%
pushd "%userprofile%"
python -m pip install --upgrade pip
python -m pip uninstall -r "%setsdir%\requirements.txt" -y
pushd "%~dp0"
echo [%date%]-[%time%] -- Requirements uninstalled! >> log.txt
call #SETUP.bat