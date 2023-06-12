@echo off
pushd "%~dp0"
python "pip.py"
cd..
set setsdir=%CD%
pushd %userprofile%
@echo on
python -m pip install -r "%setsdir%\requirements.txt"
@echo off
pushd "%~dp0"
echo [%date%]-[%time%] -- Requirements installed! >> log.txt
echo [%date%]-[%time%] -- Requirements installed!
pause

