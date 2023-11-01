dir /b /s *lib-???.jar  > out.tmp
@echo off
setlocal enabledelayedexpansion

FOR /F "tokens=* USEBACKQ" %%F IN (`FINDSTR "build\libs" out.tmp`) DO (
    call :separate "%%F"
    FOR /F "tokens=* USEBACKQ" %%L IN (`FINDSTR "!right!" out.tmp`) DO (
        if not %%F == %%L (
            cp "%%F" "%%L"
            echo cp "%%F" "%%L"
        )
    )
)
del "out.tmp"
::@PAUSE
goto :EOF

:separate
set "base=%~1"
set "left=%base:build\libs\=" & set "right=%"
::echo Left=!left!
::echo Right=!right!
exit /B
