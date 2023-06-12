# HOW SETS_LOADER WORKS
The concept is to have a single file, that would never need an update and could install all of SETS from GitHub. This is possible, but it is suggested to also require a pre-downloaded folder with the images to circumvent a very tiresome downloading process. The single file (namely #DOWNLOAD_ENVIRONMENT.bat) downloads a downloader (namely .debug\~downloader.bat), which then downloads all required files. This way the user does not have to do manual downloads whenever the app structure changes. It also supplies batch files to run the app and various debug files.

To make this work you have to mirror the app structure inside the three files ~app_files.txt, ~environment_files.txt and ~folders.txt. For the files simply add them each in a new line with their paths (backslash is used as folder seperator). ~app_files only contains the files that contain code, ~environment_files contains all files. For folders add folders each in a new line with a trailing backslash. Make sure that subfolders are below their superior folders in the file. For files and folders spaces are not supported an the name.