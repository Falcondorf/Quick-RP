echo off
cls
echo Welcome, you asked to start the Game Quick-RP

:head
echo. 
echo Do you want to start the game? (1)
echo Install Game (2)
echo Uninstall Game (3)
echo Quit (4)? 
CHOICE /C:1234 /m "Enter your choice: "

if %ERRORLEVEL%==1 goto lancer
if %ERRORLEVEL%==2 goto installer
if %ERRORLEVEL%==3 goto desinstaller
if %ERRORLEVEL%==4 goto fin

:installer
cls
if exist C:\QuickRP-Game\Main.rb goto installerErr
mkdir C:\quickRP-Game
copy run_game.bat C:\QuickRP-Game
copy *.rb C:\QuickRP-Game
fsutil hardlink create C:%HOMEPATH%\Desktop\run_quickRP.bat C:\QuickRP-Game\run_game.bat
cls
echo The game is now installed on your computer
goto head

:installerErr
cls
echo.
echo The game is already installed
goto head

:desinstaller
if not exist C:\QuickRP-Game goto desinstallerErr
rd /s /q C:\QuickRP-Game
del C:%HOMEPATH%\Desktop\run_quickRP.bat
cls
echo.
echo Sucessfully uninstalled
goto head

:desinstallerErr
cls
echo.
echo There is nothing to uninstall
goto head

:lancer
cls
if not exist C:\QuickRP-Game\Main.rb goto lancerErr
ruby C:\quickRP-Game\Main.rb
cls
goto head

:lancerErr
cls
echo.
echo The game is not yet installed
goto head

:fin
echo.
echo Thanks for playing Quick-RP
pause