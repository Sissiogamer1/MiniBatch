@echo off
title MiniBatch
echo Welcome back in MiniBatch v0.0.8!
echo Sword: %swordtype%
echo Pick: %picktype%
echo Axe: %axetype%
goto main

:main
cls
echo 1. Go mine
echo 2. Go fight
echo 3. Go chop
choice /c 123 /m "What do you want to do?"
if %errorlevel% equ 1 (
    goto mine
)
if %errorlevel% equ 2 (
    goto fight
)
if %errorlevel% equ 3 (
    goto chop
)
:mine
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
goto main

:fight
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
goto main

:chop
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
goto main