@echo off
setlocal enabledelayedexpansion

set "taskfile=tasks.txt"

:main
cls
echo =========================
echo To-Do List Manager
echo =========================
echo 1. Add Task
echo 2. View Tasks
echo 3. Remove Task
echo 4. Exit
echo =========================
set /p option="Choose an option: "

if "%option%"=="1" goto add_task
if "%option%"=="2" goto view_tasks
if "%option%"=="3" goto remove_task
if "%option%"=="4" exit

goto main

:add_task
cls
set /p task="Enter task description: "
echo %task% >> %taskfile%
echo Task added!
pause
goto main

:view_tasks
cls
echo =========================
echo Current Tasks
echo =========================
type %taskfile%
echo =========================
pause
goto main

:remove_task
cls
echo =========================
echo Remove Task
echo =========================
type %taskfile%
echo =========================
set /p line="Enter the line number of the task to remove: "
set /a line=%line%-1
(for /f "delims=" %%a in ('type %taskfile%') do (
    set /a "n+=1"
    if !n! neq %line% echo %%a
)) > temp.txt
move /y temp.txt %taskfile%
echo Task removed!
pause
goto main
