@echo off
setlocal enabledelayedexpansion

:menu
cls
echo ** Advanced File Explorer **
echo 1. List files and directories
echo 2. Search by extension
echo 3. Sort folders by letter
echo 4. Exit
set /p choice=Choose an option:

if "%choice%"=="1" goto list_files
if "%choice%"=="2" goto search_extension
if "%choice%"=="3" goto sort_folders
if "%choice%"=="4" exit /b

goto menu

:list_files
cls
set /p dir=Enter the directory path:
echo Files and directories in %dir%:
echo.
dir "%dir%" /b /o:n
echo.
pause
goto menu

:search_extension
cls
set /p dir=Enter the directory path:
set /p ext=Enter the file extension to search for (e.g., .exe):
echo Searching for %ext% files in %dir%:
echo.
for /r "%dir%" %%f in (*%ext%) do (
    echo %%f
)
echo.
pause
goto menu

:sort_folders
cls
set /p dir=Enter the directory path:
echo Folders in %dir% sorted by letter:
echo.
for /d %%d in ("%dir%\*") do (
    set "folder=%%~nxd"
    echo !folder!
)
echo.
pause
goto menu
