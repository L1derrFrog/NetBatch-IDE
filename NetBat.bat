@echo off
setlocal EnableDelayedExpansion
color 0A
title NetBatch IDE v.1.0 Enviroment ~ L1derrFrog  
mode 100,35
chcp 65001 >nul


REM NetBatch IDE 1. ~ L1derrFrog.
REM
REM Free and Open Source IDE for batchfile (automatizated windows tasks.)
REM
REM SOCIAL:
REM github.com/L1derrFrog
REM github.com/L1derrFrog/NetBatch-IDE 

:setuping
echo.
mkdir proyects
mkdir FTP
goto idle


:idle
cls
echo.
echo ╔═════════════════════════════════════════════════════════════════════════════════════════╗   
echo ║NetBatch IDE v1.0      // use .nav to see your proyects                                  ║   
echo ╠═════════════════════════════════════════════════════════════════════════════════════════╣
echo ╚═════════════════════════════════════════════════════════════════════════════════════════╝
echo.
echo.
echo ╔════════════════════════════╗   
echo ║ Navigation                 ║   
echo ╠════════════════════════════╣   
echo ║ #1 New Blank File          ║   
echo ║ #2 New Proyect             ║  
echo ║ #3 New Window File         ║   
echo ╚════════════════════════════╝   

echo.
set /p opt="> "   
echo Hola 
if "%opt%"=="1" goto newfile
if "%opt%"=="2" goto newproyect
if "%opt%"=="3" goto window_file_ftp
) else (
  goto idle
)

:window_file_ftp
cls
cd "ftp"
start "" "new_file.bat"
goto idle


REM Proyect Strucutre
:newproyect
cls
echo.
echo NetBat IDE.
echo Open source IDE ~ L1derrFrog 2024.
echo.
echo.
echo.
set /p titleproyect="Select a proyect title> "
set prytitle=%titleproyect%
goto proyectstructure

:proyectstructure
cd "proyects"
cls
echo.
echo NetBat IDE.
echo Open source IDE ~ L1derrFrog 2024.
echo.
echo.
echo.
mkdir "%titleproyect%"
cd "%titleproyect%"
(
  echo @echo off
  echo REM -------
  echo REM This is your main file structure.
  echo REM -------
  echo :menu
  echo cls
  echo echo Hello, pause!
  echo pause 
  echo REM -------
  echo REM You can start coding!
  echo REM -------
) >> main.bat
goto proyectnewfile


:proyectnewfile
cls
echo.
echo NetBat IDE.
echo Open source IDE ~ L1derrFrog 2024.
echo.
echo.
echo You can see the basic strucutre of batch in "main.bat"
set /p filetitle="Select a file title> "
goto filecoding2

:filecoding2
cls
echo.
echo NetBat IDE.
echo Open source IDE ~ L1derrFrog 2024.
echo.
echo.
echo.
echo "%filetitle%"
echo.

set "content="

:inputloop2
set /p line="> "
if /i "%line%"==".save" goto savefile2
if /i "%line%"==".menu" goto idle
set "content=!content!!line!^&echo."

goto inputloop2

:savefile2
(
echo %content%
) > "%filetitle%.bat"





REM Here is the end of the proyect code.




:newfile
cls
echo.
echo NetBat IDE.
echo Open source IDE ~ L1derrFrog 2024.
echo.
echo.
echo.
set /p filetitle="Select a file title> "
goto filecoding

:filecoding
cls
echo.
echo NetBat IDE.
echo Open source IDE ~ L1derrFrog 2024.
echo.
echo.
echo.
echo "%filetitle%"
echo.

set "content="

:inputloop
set /p line="> "
if /i "%line%"==".save" goto savefile
if /i "%line%"==".menu" goto idle
set "content=!content!!line!^&echo."

goto inputloop

:savefile
(
echo %content%
) > "%filetitle%.bat"

echo Code saved as "%filetitle%.bat"
pause
goto idle

