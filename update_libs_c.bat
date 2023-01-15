dir /b /s *%formatHeader%  > out.tmp
@echo off
setlocal enabledelayedexpansion

set formatHeader=.h
set formatDLib=.dll
set formatSLib=.a

FOR /F "tokens=* USEBACKQ" %%F IN (`FINDSTR "header" out.tmp`) DO (
    call :separate "%%F"
    ::echo Dir=!left!
    set "dir=!left!"
    set "name=!right:%formatHeader%=!"
    set "dLibFile="
    set "sLibFile="
    IF EXIST "!left!!name!.c" (
        ::echo "YES !name!"
        IF EXIST "!left!!name!%formatDLib%" (
            ::echo "DIN: !left!!name!%formatDLib%"
            set "dLibFile=!name!%formatDLib%"
        )
        IF EXIST "!left!!name!%formatSLib%" (
            ::echo "STA: !left!!name!%formatSLib%"
            set "sLibFile=!name!%formatSLib%"
        )
        IF NOT "!dLibFile!" == "" (
            ::echo "!left!"
            echo "!name!%formatHeader%  !dLibFile!"
            FOR /F "tokens=* USEBACKQ" %%L IN (`FINDSTR "!name!%formatHeader%" out.tmp`) DO (
                if not %%F == %%L (
                    echo.
                    echo   "Header"
                    ::echo   "%%L"
                    cp "%%F" "%%L"
                    echo   cp "%%F" "%%L"
                    call :separate "%%L"
                    IF EXIST "!left!!name!%formatDLib%" (
                        echo   "DIN"
                        ::echo   "!left!!name!%formatDLib%"
                        cp "!dir!!name!%formatDLib%" "!left!!name!%formatDLib%"
                        echo   cp "!dir!!name!%formatDLib%" "!left!!name!%formatDLib%"
                    )
                )
            )
            echo.
            echo.
        )
        IF NOT "!sLibFile!" == "" (
            ::echo "!left!"
            echo "!name!%formatHeader%  !sLibFile!"
            FOR /F "tokens=* USEBACKQ" %%L IN (`FINDSTR "!name!%formatHeader%" out.tmp`) DO (
                if not %%F == %%L (
                    echo.
                    echo   "Header"
                    echo   "%%L"
                    cp "%%F" "%%L"
                    echo   cp "%%F" "%%L"
                    call :separate "%%L"
                    IF EXIST "!left!!name!%formatSLib%" (
                        echo   "STA"
                        ::echo   "!left!!name!%formatSLib%"
                        cp "!dir!!name!%formatSLib%" "!left!!name!%formatSLib%"
                        echo   cp "!dir!!name!%formatSLib%" "!left!!name!%formatSLib%"
                    )
                )
            )
            echo.
            echo.
        )
    )
)
del "out.tmp"
::@PAUSE
goto :EOF

:separate
set "base=%~1"
set "left=%base:header\=" & set "right=%"
::echo Left=!left!
::echo Right=!right!
exit /B
