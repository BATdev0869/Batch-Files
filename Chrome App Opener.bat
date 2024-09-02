@echo off

color 0A

echo Open this link in distraction free chrome

SET p input=Enter url 

SET stringAppParam=^-^-app^=
SET finalParam=%stringAppParam%%input%

REM C:/ProgramData/Microsoft/Windows/Start Menu/Programs/Google Chrome

START  chrome -app=https://google.com --no-referrers --incognito