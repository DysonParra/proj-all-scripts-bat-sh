@echo off
setlocal enabledelayedexpansion
set fileName="%1"
set fileName=%fileName:"=%
echo Searching %1
call :separate "%1"
echo Searching %right%
if not "%fileName%" == "" (
    dir /b /s %right% > out.tmp
    FOR /F "tokens=* USEBACKQ" %%F IN (out.tmp) DO (
        if not "%%F" == "%fileName%" (
            echo cp "%fileName%" "%%F"
            cp "%fileName%" "%%F"
        )
    )
    del "out.tmp"
) else (
    echo FileName not specified
)

:separate
set "base=%~1"
set "left=%base:\=" & set "right=%"
::echo Left=!left!
::echo Right=!right!
exit /B