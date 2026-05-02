# SOTN-Arcane-Engine-ReImagined-AERI-

*DISCLAIMER*
This is my first major scripting project and I am by no means a programmer
There will almost certainly be bugs that I lack the knowledge and/or patience to fix, so consider yourself warned...
This engine was designed for and primarily tested on keyboard but should(?) work with most controller bindings
Analog stick controls are not compatible with my input parser yet(?) and will only perform their vanilla functions


What is AERI:
AERI is a lua script for Castlevania: Symphony of the Night that aims to rework how the movement and spell system works. This project was designed for casual/randomizer players and helps people like me that suck at fighting game inputs and/or get wrist pain playing SOTN. Most options can be customized/disabled in the config in order to fit personal preference. Script runs alongside SOTN so standard combos for spells/movement will still work as they do in vanilla.


Getting started with AERI:
1. Download the latest SOTN Arcane Engine ReImagined (AERI).zip from github
2. Unzip and place the main "SOTN Arcane Engine ReImagined (AERI)" folder into BizHawk's Lua folder
3. Leave all file locations/names alone since the script references file paths with the main folder as the root
4. Open the config to familiarize yourself with the controls and edit whatever controls you want
5. Open BizHawk and run "SOTN Arcane Engine ReImagined (AERI).lua" in the lua console
6. Open up your SOTN ROM of choice and enjoy!


Compatibility:
1. Script written and tested using Bizhawk ver 2.11 and SOTN NymaFastCore, compatibility with other cores/versions not guaranteed
2. Tested in conjunction with Archipelago and is fully compatible (as far as I know)
3. Script is also fully compatible with the map location tracker in SOTN Rando Tools (again, as far as my testing goes)
4. This script may not be compatible with other input read/execution scripts or scripts that edit certain ram addresses (have not done testing)



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



