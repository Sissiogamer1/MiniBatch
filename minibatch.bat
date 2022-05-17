@echo off
title MiniBatch
cd %~dp0
echo Welcome back in MiniBatch v0.1_2!
echo Sword: %swordtype%
echo Pick: %picktype%
echo Axe: %axetype%
timeout /t 2 /nobreak >nul
echo Press any key to continue
pause >nul
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
if %mine% equ 1 (
    set /a minelootiron=%random% %%26
)
if %mine% equ 2 (
    set /a minelootdiamond=%random% %%51
)
if %mine% equ 3 (
    set /a minelootdiamond=%random% %%101
)
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
if %mine% equ 1 (
    echo You mined %minelootiron% Iron ores with your %picktype%
)
if %mine% equ 2 (
    echo You mined %minelootdiamond% Diamond ores with your %picktype%
)
if %mine% equ 3 (
    echo You mined %minelootdiamond% Diamond ores with your %picktype%
)
timeout /t 2 /nobreak >nul
echo Press any key to continue
pause >nul
if %mine% equ 1 (
    set /a currentallminelootiron=%allminelootiron%+%minelootiron%
    set /a allminelootiron=%currentallminelootiron%
)
if %mine% equ 2 (
    set /a currentallminelootdiamond=%allminelootdiamond%+%minelootdiamond%
    set /a allminelootdiamond=%currentallminelootdiamond%
)
if %mine% equ 3 (
    set /a currentallminelootdiamond=%allminelootdiamond%+%minelootdiamond%
    set /a allminelootdiamond=%currentallminelootdiamond%
)
cd userinv
(
    echo allminelootiron=%allminelootiron%
    echo allminelootdiamond=%allminelootdiamond%
    echo allfightlootzombie=%allfightlootzombie%
    echo allfightlootskeleton=%allfightlootskeleton%
    echo allfightlootspider=%allfightlootspider%
    echo allchoplootwood=%allchoplootwood%
    echo allchoplootapple=%allchoplootapple%
) > file.txt
cd ..
if %mine% equ 1 (
    set /a mineloot=%random% %%26
)
if %mine% equ 2 (
    set /a mineloot=%random% %%51
)
if %mine% equ 3 (
    set /a mineloot=%random% %%101
)
goto main

:fight
if %fight% equ 1 (
    set /a fightlootzombie=%random% %%9
    set /a fightlootskeleton=%random% %%4
    set /a fightlootspider=%random% %%7
    set /a damage=%random% %%7
)
if %fight% equ 2 (
    set /a fightlootzombie=%random% %%14
    set /a fightlootskeleton=%random% %%7
    set /a fightlootspider=%random% %%11
    set /a damage=%random% %%5
)
if %fight% equ 3 (
    set /a fightlootzombie=%random% %%27
    set /a fightlootskeleton=%random% %%15
    set /a fightlootspider=%random% %%26
    set /a damage=%random% %%3
)
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
timeout /t 2 /nobreak >nul
if %health% lss 1 (
    cls
    timeout /t 1 /nobreak >nul
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
set /a currentallfightlootskeleton=%allfightlootskeleton%+%fightlootskeleton%
set /a currentallfightlootzombie=%allfightlootzombie%+%fightlootzombie%
set /a currentallfightlootspider=%allfightlootspider%+%fightlootspider%
set /a allfightlootskeleton=%currentallfightlootskeleton%
set /a allfightlootzombie=%currentallfightlootzombie%
set /a allfightlootspider=%currentallfightlootspider%
cd userinv
(
    echo allminelootiron=%allminelootiron%
    echo allminelootdiamond=%allminelootdiamond%
    echo allfightlootzombie=%allfightlootzombie%
    echo allfightlootskeleton=%allfightlootskeleton%
    echo allfightlootspider=%allfightlootspider%
    echo allchoplootwood=%allchoplootwood%
    echo allchoplootapple=%allchoplootapple%
) > file.txt
cd ..
if %fight% equ 1 (
    set /a fightlootzombie=%random% %%9
    set /a fightlootskeleton=%random% %%4
    set /a fightlootspider=%random% %%7
    set /a damage=%random% %%7
)
if %fight% equ 2 (
    set /a fightlootzombie=%random% %%14
    set /a fightlootskeleton=%random% %%7
    set /a fightlootspider=%random% %%11
    set /a damage=%random% %%5
)
if %fight% equ 3 (
    set /a fightlootzombie=%random% %%27
    set /a fightlootskeleton=%random% %%15
    set /a fightlootspider=%random% %%26
    set /a damage=%random% %%3
)
cls
goto main

:chop
if %chop% equ 1 (
    set /a choplootwood=%random% %%16
    set /a choplootapple=%random% %%3
)
if %chop% equ 2 (
    set /a choplootwood=%random% %%25
    set /a choplootapple=%random% %%5
)
if %chop% equ 3 (
    set /a choplootwood=%random% %%33
    set /a choplootapple=%random% %%9
)
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
set /a currentallchoplootwood=%allchoplootwood%+%choplootwood%
set /a currentallchoplootapple=%allchoplootapple%+%choplootapple%
set /a allchoplootwood=%currentallchoplootwood%
set /a allchoplootapple=%currentallchoplootapple%
cd userinv
(
    echo allminelootiron=%allminelootiron%
    echo allminelootdiamond=%allminelootdiamond%
    echo allfightlootzombie=%allfightlootzombie%
    echo allfightlootskeleton=%allfightlootskeleton%
    echo allfightlootspider=%allfightlootspider%
    echo allchoplootwood=%allchoplootwood%
    echo allchoplootapple=%allchoplootapple%
) > file.txt
cd ..
if %chop% equ 1 (
    set /a choplootwood=%random% %%16
    set /a choplootapple=%random% %%3
)
if %chop% equ 2 (
    set /a choplootwood=%random% %%25
    set /a choplootapple=%random% %%5
)
if %chop% equ 3 (
    set /a choplootwood=%random% %%33
    set /a choplootapple=%random% %%9
)
goto main
