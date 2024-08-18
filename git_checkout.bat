@echo off
set currentPath="%cd%"
set gitPath="%1"
set currentPath=%currentPath:"=%
set gitPath=%gitPath:"=%
echo Current path = "%currentPath%"
if not "%gitPath%" == "" (
    echo Git path = "%gitPath%"
    cd "%gitPath%"
    echo New path = "%gitPath%"
) else (
    echo Git path not specified using current path
)
::dir > out.tmp
echo.
echo git checkout master
::git checkout master
cd "%currentPath%"
echo.
echo.
echo.