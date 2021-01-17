cls
@echo off
set KEIL_BIN_FOLDER=C:\Keil_v5\C51\BIN
echo author:kcqnly
echo compiling....

if exist %~1\build (
    rd/s/q %~1\build
)

if not exist %~1\build ( 
    mkdir %~1\build 
    mkdir %~1\build\Listings 
    mkdir %~1\build\Objects 
)


cd %~2
for %%i in (*.c) do ( 
    echo %%i
    call "%KEIL_BIN_FOLDER%\C51.EXE" %%i >> %~1\build\compile.log || goto error
)
for %%i in (*.LST) do ( move %%i %~1\build > NUL ) || goto error
for %%i in (*.OBJ) do ( move %%i %~1\build > NUL ) || goto error
call "%KEIL_BIN_FOLDER%\A51.EXE" "%~3\STARTUP.A51" >NUL || goto error

cd %~3
move STARTUP.OBJ %~1\build > NUL || goto error
move STARTUP.LST %~1\build > NUL || goto error

if not exist %~1\build\C51S.LIB ( copy "%~3\C51S.LIB" "%~1\build" > NUL) || goto error
cd %~1\build
@setlocal enableextensions enabledelayedexpansion
set result=C51S.LIB
for %%i in (*.OBJ) do (
    set result=!result!,%%i
)
call "%KEIL_BIN_FOLDER%\BL51.EXE" %result% TO %4 >> "%~1\build\compile.log" || goto error
call "%KEIL_BIN_FOLDER%\OH51.EXE" "%~1\build\%4" >> "%~1\build\compile.log" || goto error
for %%i in (*.LST) do ( move %%i %~1\build\Listings > NUL || goto error )
for %%i in (*.OBJ) do ( move %%i %~1\build\Objects > NUL || goto error)
for %%i in (*.M51) do ( move %%i %1\build\Listings > NUL || goto error)
if exist %~1\build\%4.hex ( echo Compilation completed: build\%4.hex )
exit 0

:error
echo Error!!!: error levele %errorlevel%
exit %errorlevel%