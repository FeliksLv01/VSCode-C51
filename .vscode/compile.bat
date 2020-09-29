@echo off
set KEIL_BIN_FOLDER=D:\Program Files\Keil5\C51\BIN
cls
echo author:kcqnly
echo compiling....

cd %~2
for %%i in (*.c) do ( 
    echo %%i
    call "%KEIL_BIN_FOLDER%\C51.EXE" %%i >> %~1/.vscode/compile.log
)
for %%i in (*.LST) do ( move %%i "%~1\output" > NUL )
for %%i in (*.OBJ) do ( move %%i "%~1\output" > NUL )
call "%KEIL_BIN_FOLDER%\A51.EXE" "%~3\STARTUP.A51" >NUL

cd %~3
move STARTUP.OBJ "%~1\output" > NUL
move STARTUP.LST "%~1\output" > NUL

if not exist %1\output\C51S.LIB ( copy "%~3\C51S.LIB" "%~1\output" > NUL)

cd %~1/output
@setlocal enableextensions enabledelayedexpansion
set result=C51S.LIB
for %%i in (*.OBJ) do (
    set result=!result!,%%i
)
call "%KEIL_BIN_FOLDER%\BL51.EXE" %result% TO %4 >> %~1/.vscode/compile.log
call "%KEIL_BIN_FOLDER%\OH51.EXE" "%~1\output\%4" >> %~1/.vscode/compile.log

if exist %1\output\%4.hex ( echo Compilation completed: output\%4.hex )
exit 0
