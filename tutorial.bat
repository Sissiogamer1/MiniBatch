@echo off
cd %~dp0
title MiniBatch Alpha Tutorial
echo Welcome in MiniBatch Alpha!
echo This is still a testing phase, so anything that could be shown in this version could not be on the final release
echo And anything could change
timeout /t 2 /nobreak >nul
echo Press any key to start MiniBatch
pause >nul
cls
echo You find yourself in an island, what do you remember?
timeout /t 2 /nobreak >nul
echo.
echo Nothing...
timeout /t 2 /nobreak >nul
echo.
echo Don't you really remember anything? Do you remember how you got here?
timeout /t 3 /nobreak >nul
echo.
echo No
echo I don't even remember who you are
timeout /t 3 /nobreak >nul
echo Hey?
echo You there?
timeout /t 2 /nobreak >nul
echo ...
timeout /t 1 /nobreak >nul
echo Uh, i guess if i just imagined this...
timeout /t 1 /nobreak >nul
echo What do i have? I must survive
echo I have
timeout /t 2 /nobreak >nul
cls
echo You find yourself in an island, what do you remember?
echo.
echo Nothing...
echo.
echo Don't you really remember anything? Do you remember how you got here?
echo.
echo No
echo I don't even remember who you are
echo Hey?
echo You there?
echo ...
echo Uh, i guess if i just imagined this...
echo What do i have? I must survive
echo I have...
timeout /t 1 /nobreak >nul
cls
echo You find yourself in an island, what do you remember?
echo.
echo Nothing...
echo.
echo Don't you really remember anything? Do you remember how you got here?
echo.
echo No
echo I don't even remember who you are
echo Hey?
echo You there?
echo ...
echo Uh, i guess if i just imagined this...
echo What do i have? I must survive
echo I have a %picktype%, a %swordtype% and a %axetype%
timeout /t 1 /nobreak >nul
echo Press any key to continue
pause >nul
cls
goto tutorial

:tutorial
set /a tempvar=0
cls
echo In the alpha phase, you can't fight, chop and mine yourself, but the program does, randomly, depending on your tool
echo When everything that must be done gets completed, you will be able to chop wood, fight enemies and mine in a cave
echo For now, you will have a "lobby" where you choose what to do
timeout /t 5 /nobreak >nul
echo Press any key to continue
pause >nul
goto aftertutorialtext

:aftertutorialtext
cls
if %tempvar% equ 3 (
    cls
    echo Tutorial ended!
    timeout /t 1 /nobreak >nul
    echo.
    echo You will be sent shortly to normal MiniBatch
    echo Enjoy!
    timeout /t 2 /nobreak >nul
    echo.
    echo Starting MiniBatch...
    set tempvar=
    if not defined tempvar (
        cd stats
        echo no > firstrun.txt
        cd ..
        start autoexec.bat
        exit
    ) else (
        set /a tempvar=
        goto aftertutorialtext
    )
)
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
set /a tempvar=1
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
    echo ::  ::   ::::::  ::    ::     ::::::  :: ::::::: ::::::  
    echo ::  ::  ::    :: ::    ::     ::   :: :: ::      ::   :: 
    echo  ::::   ::    :: ::    ::     ::   :: :: :::::   ::   :: 
    echo   ::    ::    :: ::    ::     ::   :: :: ::      ::   :: 
    echo   ::     ::::::   ::::::      ::::::  :: ::::::: ::::::  
    timeout /t 3 /nobreak >nul
    echo In this alpha version, nothing will change if you die and your health will be back to 20
    set /a health=20
)
timeout /t 2 /nobreak >nul
echo Press any key to continue
pause >nul
set /a tempvar=%tempvar%+1
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
set /a tempvar=%tempvar%+1
goto aftertutorialtext