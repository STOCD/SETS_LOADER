@echo off
pushd "%~dp0"
cd..
set setsdir=%CD%
pushd %userprofile%
@echo on
python -m pip install --upgrade pip
python -m pip install -r "%setsdir%\requirements.txt"
@echo off
pushd "%~dp0"
echo [%date%]-[%time%] -- Requirements installed! >> log.txt
echo [%date%]-[%time%] -- Requirements installed!
pause

