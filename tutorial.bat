@echo off
cd %~dp0
title MiniBatch Alpha v0.0.8
echo Welcome in MiniBatch Alpha!
echo This is still a testing phase, so anything that could be shown in this version could not be on the final release
echo And anything could change
timeout /t 2 /nobreak >nul
echo Press any key to start MiniBatch
pause >nul
if %firstrun% equ 1 (
    echo INTRODUCTION SAMPLE TEXT
    echo You have a %swordtype%, a %picktype% and a %axetype%.
    echo Press any key to continue
    pause >nul
    cls
    goto tutorial
)

:tutorial
cls
echo In the alpha phase, you cant fight, chop and mine yourself, but the program does, randomly, depending on your tool
echo When everything that must be done gets completed, you will be able to chop wood, fight enemies and mine in a cave
echo For now, you will have a "lobby" where you choose what to do
timeout /t 5 /nobreak >nul
echo Press any key to continue
pause >nul
goto aftertutorialtext

:aftertutorialtext
cls
echo 1. Go mine
echo 2. Go fight
echo 3. Go chop
choice /c 123 /m "What do you want to do?"
if %errorlevel% equ 1 (
    goto minetutorial
)
if %errorlevel% equ 2 (
    goto fighttutorial
)
if %errorlevel% equ 3 (
    goto choptutorial
)

:minetutorial
cls
echo Loots will change depending on your tool (and your luck)
echo Press any key to continue
pause >nul
cls
echo Mining.
timeout /t 1 /nobreak >nul
cls
echo Mining..
timeout /t 1 /nobreak >nul
cls
echo Mining...
timeout /t 1 /nobreak >nul
cls
echo You mined %mineloot% Iron ores with your %picktype%.
timeout /t 2 /nobreak >nul
echo Press any key to continue
pause >nul
set
goto aftertutorialtext

:fighttutorial
cls
echo Monster's loots will change depending on your tool (and your luck)
echo Press any key to continue
pause >nul
cls
echo Fighting.
timeout /t 1 /nobreak >nul
cls
echo Fighting..
timeout /t 1 /nobreak >nul
cls
echo Fighting...
timeout /t 1 /nobreak >nul
cls
echo You fought some monsters with your %swordtype% and got:
echo %fightlootskeleton% bones from a skeleton
echo %fightlootzombie% rotten flesh from a zombie
echo %fightlootspider% strings from a spider
timeout /t 1 /nobreak >nul
echo You also took %damage% damage
set /a currenthealth=%health%-%damage%
echo Your health is %currenthealth%
set /a health=%currenthealth%
if %health% lss 1 (
    timeout /t 1 /nobreak >nul
    cls
    echo ██  ██   ██████  ██    ██     ██████  ██ ███████ ██████  
    echo ██  ██  ██    ██ ██    ██     ██   ██ ██ ██      ██   ██ 
    echo  ████   ██    ██ ██    ██     ██   ██ ██ █████   ██   ██ 
    echo   ██    ██    ██ ██    ██     ██   ██ ██ ██      ██   ██ 
    echo   ██     ██████   ██████      ██████  ██ ███████ ██████  
    echo Sorry for the inconvenience, but this text format is not supported in cmd, this problem will be fixed 
    timeout /t 3 /nobreak >nul
    echo In this alpha version, nothing will change if you die and your health will be back to 20
    set /a health=20
)
timeout /t 2 /nobreak >nul
echo Press any key to continue
pause >nul
set
goto aftertutorialtext

:choptutorial
cls
echo Wood loots will change depending on your tool (and your luck)
echo Press any key to continue
pause >nul
cls
echo Chopping.
timeout /t 1 /nobreak >nul
cls
echo Chopping..
timeout /t 1 /nobreak >nul
cls
echo Chopping...
timeout /t 1 /nobreak >nul
cls
echo You chopped %choplootwood% Wood Planks and %choplootapple% Apples with your %axetype%.
timeout /t 2 /nobreak >nul
echo Press any key to continue
pause >nul
cls
echo Tutorial ended!
cd stats
echo no > firstrun.txt
timeout /t 2 /nobreak >nul
cd ..
start minibatch.bat