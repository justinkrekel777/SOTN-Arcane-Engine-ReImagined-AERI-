------------------------------------------------------------------------------------------------------------------------
------------------"Castlevania: Symphony of the Night - Arcane Engine ReImagined (AERI) README file"--------------------
------------------------------------------------------------------------------------------------------------------------

            Welcome to Arcane Engine ReImagined!!! Check out the Config file for more info and setup options!
                 Please ignore any and all spaghetti code. I am not a programmer, nor do I want to be :)

Script by: Justin Krekel


Attributions:
Code written using PyCharm
Title screen art made with AI cus I suck at making nice pixel art (this is the only AI asset in this project), if you don't like that then go cry about it to someone who cares
All other custom UI elements were made by hand or by using assets from SOTN sprite sheets provided at https://www.castlevaniacrypt.com/sotn-sprites/
All assets (including legacy versions) are available in the Assets folder for your viewing pleasure!
The custom animation scrolls were especially painful to make so you damn well better appreciate them...


*DISCLAIMER*
This is my first major scripting project and I am by no means a programmer
There will almost certainly be bugs that I lack the knowledge and/or patience to fix, so consider yourself warned...
This engine was designed for and primarily tested on keyboard but should(?) work with most controller bindings
Analog stick controls are not compatible with my input parser yet(?) and will only perform their vanilla functions


Getting started with AERI:
1. Download the latest SOTN Arcane Engine ReImagined (AERI).zip from github
2. Unzip and place the main "SOTN Arcane Engine ReImagined (AERI)" folder into BizHawk's Lua folder
3. Leave all file locations/names alone since the script references file paths with the main folder as the root
4. Open the config to familiarize yourself with the controls and edit whatever controls you want
5. Open BizHawk and run "SOTN Arcane Engine ReImagined (AERI).lua" in the lua console
6. Open up your SOTN ROM of choice and enjoy!


Compatibility:
This script has been tested in conjunction with Archipelago and SOTN.io randomizers and is fully compatible (as far as I know)
It is also fully compatible with the map location tracker in SOTN Rando Tools (again, as far as my testing goes)
This script may not be compatible with other input read/execution scripts or scripts that edit certain ram addresses (have not done testing)



Basic debugging:
(Go through each set of processes and check if the bug is fixed)

1. Hit the refresh script button on the lua console

1. Close and reopen the lua console
2. Relaunch script

1. Enable input reader debug function in the config file and test if each bind is reading
2. Fix any binds that don't register or register incorrectly

1. Save your current config somewhere safe for later referencing
2. Copy/paste both the .lua and .config in the backups folder into the main SOTN Arcane Engine ReImagined (AERI)
3. Rename both .lua and .config files (file names must be "SOTN Arcane Engine ReImagined (AERI).lua" and "SOTN AERI.config" to read properly)
4. Close and reopen the lua console
5. Run the new (backup) script

1. If nothing else works, delete the main "SOTN Arcane Engine ReImagined (AERI)" folder and all sub folders and try a fresh download

Advance debugging:
(If none of the basic debugging works and you have coding knowledge then follow steps below)

1. (Optional) Pray to whatever higher power will listen
2. Enable all debug options in the config and refresh the script
3. Open the script in any text editor (pycharm works best)
4. Cross reference logic/ram/variables with the OSDs and console logging for your specific bug and fix it yourself

I already said I'm not a programmer, what else do you want from me???
All jokes aside, I did warn that there will almost certainly be bugs... So good luck :)


