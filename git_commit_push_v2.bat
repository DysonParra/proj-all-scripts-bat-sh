@echo off
set actualPath="%cd%"
set messsage="%1"
set gitPath="%2"
set actualPath=%actualPath:"=%
set messsage=%messsage:"=%
set gitPath=%gitPath:"=%
if not "%messsage%" == "" (
    echo Actual path = "%actualPath%"
    echo Message = "%messsage%"
    if not "%gitPath%" == "" (
        echo Git path = "%gitPath%"
        cd "%gitPath%"
        echo New path = "%gitPath%"
    ) else (
        echo Git path not specified using actual path
    )
    ::dir > out.tmp
    echo.
    ::echo git add .
    ::echo git commit -m "%messsage%"
    ::echo git push
    git add . && git commit -m "%messsage%" && git push
    cd "%actualPath%"
    echo.
    echo.
    echo.
) else (
    echo Message not specified
)
