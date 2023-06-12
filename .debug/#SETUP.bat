pushd "%~dp0"
python "pip.py"
cd..
set setsdir=%CD%
pushd %userprofile%
python -m pip install -r %setsdir%\requirements.txt
pushd "%~dp0"
echo [%date%]-[%time%] -- Requirements installed! >> log.txt
echo [%date%]-[%time%] -- Requirements installed!
pause

