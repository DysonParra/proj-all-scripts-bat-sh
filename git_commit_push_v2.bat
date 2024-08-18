@echo off
set currentPath="%cd%"
set messsage="%1"
set gitPath="%2"
set currentPath=%currentPath:"=%
set messsage=%messsage:"=%
set gitPath=%gitPath:"=%
if not "%messsage%" == "" (
    echo Current path = "%currentPath%"
    echo Message = "%messsage%"
    if not "%gitPath%" == "" (
        echo Git path = "%gitPath%"
        cd "%gitPath%"
        echo New path = "%gitPath%"
    ) else (
        echo Git path not specified using current path
    )
    ::dir > out.tmp
    echo.
    ::echo git add .
    ::echo git commit -m "%messsage%"
    ::echo git push
    git add . && git commit -m "%messsage%" && git push
    cd "%currentPath%"
    echo.
    echo.
    echo.
) else (
    echo Message not specified
)
