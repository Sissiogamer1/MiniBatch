@echo off
title MiniBatch plus


::Main menu
:mainmenu
cls
echo MiniBatch
echo ---------
echo 1.Play
echo 2.Help
echo 3.Quit
echo ---------
echo Version: Alpha v0.1.9
echo.
choice /c 123 /m "Where do you want to go?"

if %errorlevel% equ 1 (
    goto start
)
if %errorlevel% equ 2 (
    goto helpmenu
)
if %errorlevel% equ 3 (
    exit
)

goto mainmenu

::Helpmenu
:helpmenu
cls
echo Help
echo ---------
echo 1.Return
echo 2.About
echo 3.Credits
echo 4.Instructions
echo ---------
echo.
choice /c 1234 /m "Where do you want to go?"

if %errorlevel% equ 1 (
    goto mainmenu
)
if %errorlevel% equ 2 (
    goto aboutmenu
)
if %errorlevel% equ 3 (
    goto creditsmenu
)
if %errorlevel% equ 4 (
    goto instructions
)
goto helpmenu

::About menu
:aboutmenu
cls
echo About
echo ---------
echo A game inspired by Minicraft
echo and Minicraft plus
echo made in Batch
echo ---------
echo 1.Return
echo.
choice /c 1 /m "Return?"

if %errorlevel% equ 1 (
    goto helpmenu
)

goto aboutmenu


::Credits menu (Including me)
:creditsmenu
cls
echo Credits
echo ---------
echo Main menus
echo GladfanIsHere
echo Creator
echo Sissiogamer1
echo ---------
echo 1.Return
echo.
choice /c 1 /m "Return?"

if %errorlevel% equ 1 (
    goto helpmenu
)

goto creditsmenu

::Instructions of the game
:instructions
cls
echo Instructions
echo ---------
echo Select between choices to guarantee you a healthy fate and
echo maintain your health greater than 0
echo ---------
echo 1.Return
echo.
choice /c 1 /m "Return?"

if %errorlevel% equ 1 (
    goto helpmenu
)

goto aboutmenu

:start
cls
SETLOCAL EnableDelayedExpansion
cd %~dp0
echo Welcome back in MiniBatch Alpha v0.1.9!
echo This versions fixes all bugs of the last version, v0.1.3, to provide you the best experience possible!
echo Sword: %swordtype%
echo Pick: %picktype%
echo Axe: %axetype%
echo Health: %health%
timeout /t 2 /nobreak >nul
echo Press any key to continue
pause >nul
goto main



:main
color 07
cls
echo 1. Go mine
echo 2. Go fight
echo 3. Go chop
echo 4. Return to Main menu
choice /c 1234 /m "What do you want to do?"
if %errorlevel% equ 1 (
    goto mine
)
if %errorlevel% equ 2 (
    goto fight
)
if %errorlevel% equ 3 (
    goto chop
)
if %errorlevel% equ 4 (
    goto mainmenu
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
set /a currentallminelootiron=%allminelootiron%+%minelootiron%
set /a allminelootiron=%currentallminelootiron%
set /a currentallminelootdiamond=%allminelootdiamond%+%minelootdiamond%
set /a allminelootdiamond=%currentallminelootdiamond%
set /a currentallminelootdiamond=%allminelootdiamond%+%minelootdiamond%
set /a allminelootdiamond=%currentallminelootdiamond%
goto save

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
timeout /t 1 /nobreak >nul
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
if !health! lss 10 (
    if !health! gtr 0 (
        choice /m "Heal yourself with an apple?"
        if !errorlevel! equ 1 (
            set /a "currentallchoplootapple=!allchoplootapple!-1" && (
                if defined currentallchoplootapple (
                    if !currentallchoplootapple! lss 0 (
                        set tempvar=1
                        echo You don't have enough apples to heal yourself
                        set /a "currentallchoplootapple=!allchoplootapple!+1" >nul
                        timeout /t 1 /nobreak >nul
                        echo Press any key to continue
                        pause >nul
                    ) else (
                        set /a "allchoplootapple=!currentallchoplootapple!" >nul
                        set /a "currenthealth=!health!+4"
                        set /a "health=!currenthealth!"
                        echo You health is now !health!
                    )
                    cd "%~dp0"
                    cd "userinv"
                    (
                        echo allminelootiron=!allminelootiron!
                        echo allminelootdiamond=!allminelootdiamond!
                        echo allfightlootzombie=!allfightlootzombie!
                        echo allfightlootskeleton=!allfightlootskeleton!
                        echo allfightlootspider=!allfightlootspider!
                        echo allchoplootwood=!allchoplootwood!
                        echo allchoplootapple=!allchoplootapple!
                        echo health=!health!
                    ) > file.txt
                    for /f "usebackqdelims=" %%A in ("file.txt") do (
                        set "%%A"
                    )
                    cd ""..""
                )
            )
        )
    )
)
if not !tempvar! equ 1 (
    set tempvar=
    timeout /t 2 /nobreak >nul
    echo Press any key to continue
    pause >nul
)
set /a currentallfightlootskeleton=%allfightlootskeleton%+%fightlootskeleton%
set /a currentallfightlootzombie=%allfightlootzombie%+%fightlootzombie%
set /a currentallfightlootspider=%allfightlootspider%+%fightlootspider%
set /a allfightlootskeleton=%currentallfightlootskeleton%
set /a allfightlootzombie=%currentallfightlootzombie%
set /a allfightlootspider=%currentallfightlootspider%
goto save

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
goto save

:save
cd userinv
(
    echo allminelootiron=%allminelootiron%
    echo allminelootdiamond=%allminelootdiamond%
    echo allfightlootzombie=%allfightlootzombie%
    echo allfightlootskeleton=%allfightlootskeleton%
    echo allfightlootspider=%allfightlootspider%
    echo allchoplootwood=%allchoplootwood%
    echo allchoplootapple=%allchoplootapple%
    echo health=%health%
) > file.txt
for /f "delims=" %%A in (file.txt) do set "%%A"
cd ..
goto main
