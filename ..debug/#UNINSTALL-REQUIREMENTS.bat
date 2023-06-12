@echo off
pushd "%~dp0"
cd..
set setsdir=%CD%
pushd "%userprofile%"
python -m pip uninstall -r "%setsdir%\requirements.txt" -y
python -m pip uninstall -y pip
pushd "%~dp0"
echo [%date%]-[%time%] -- Requirements uninstalled! >> log.txt
echo [%date%]-[%time%] -- Requirements uninstalled!
pause
