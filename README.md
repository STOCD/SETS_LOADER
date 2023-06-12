# SETS_LOADER
Collection of batch files used to install SETS and its dependencies and keep them up to date.
GitHub Repository: https://github.com/STOCD/SETS_LOADER

# === THIS ONLY WORKS FOR WINDOWS COMPUTERS ===

## HOW TO USE
This loader is available through download from https://stobuilds.com/SETS/downloads.html including a pre-downloaded image folder.

- Make sure to unpack the supplied folder and move it to where you want SETS to be installed.
- Install python 3, this can be either done through the Mircrosoft store or by downloading the python installer from www.python.org/downloads/windows/. Make sure to install python to PATH.
- Run #DOWNLOAD_ENVIRONMENT.bat to download and install the app.
- Run RUN.bat to start the app

- Every time you want to get a new version of the app, run #DOWNLOAD_APP.bat.
- Every time you want to download the whole environment, run #DOWNLOAD_ENVIRONMENT.bat.
- You will find a log file inside the debug folder

## DEBUG
In the debug folder you will find various files for debugging. Internal files start with a leading tilde (~); manipulate or execute them at own risk.
- #RELOAD_REQUIREMENTS.bat uninstalls all requirements and reinstalls them
- #RUN-SNAPSHOT.bat creates a snapshot of your system information and stores it in "snapshot-output.txt"
- #SETUP.bat installs requirements (not necessary to run manually)
- #UNINSTALL_REQUIREMENTS.bat uninstalls requirements

## HOW SETS_LOADER WORKS
-> see https://github.com/STOCD/SETS_LOADER/blob/main/backend.md
