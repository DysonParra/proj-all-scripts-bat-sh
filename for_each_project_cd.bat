
@echo off
setlocal enabledelayedexpansion
set projectFile=.gitignore
set currentPath=%cd%
set filePath=%currentPath%\%projectFile%
set firstArg="%1"
::echo "%firstArg%"
set args=%*
set firstArg=%firstArg:"=%
if not "%firstArg%" == "" (
    ::echo First arg = "%firstArg%"
    dir /b /s %projectFile% > out.tmp
    FOR /F "tokens=* USEBACKQ" %%F IN (out.tmp) DO (
        call :separate "%%F"
        if not "%%F" == "%filePath%" (
            ::echo "%%F"
            set argsAux=%args%
            call set comm=!argsAux:%%projectPath%%=project_value_path!
            ::echo !comm!
            set comm=!comm:project_value_path=%%F%_PATH!
            ::echo !comm!
            set comm=!comm:\%projectFile%_PATH=!
            cd !left!
            ::echo !comm!
            call !comm!
            cd %currentPath%
        )
    )
    cd %currentPath%
    del "out.tmp"
) else (
    echo "No args specified"
)
::@PAUSE
goto :EOF

:separate
set "base=%~1"
set "left=%base:\.gitignore=" & set "right=%"
exit /B
