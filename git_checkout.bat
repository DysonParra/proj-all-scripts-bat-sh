@echo off
set actualPath="%cd%"
set gitPath="%1"
set actualPath=%actualPath:"=%
set gitPath=%gitPath:"=%
echo Actual path = "%actualPath%"
if not "%gitPath%" == "" (
    echo Git path = "%gitPath%"
    cd "%gitPath%"
    echo New path = "%gitPath%"
) else (
    echo Git path not specified using actual path
)
::dir > out.tmp
echo.
echo git checkout master
::git checkout master
cd "%actualPath%"
echo.
echo.
echo.