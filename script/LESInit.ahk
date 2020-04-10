; Live Enhancement Suite for Windows
;
; Copyright (c) 2019 - 2020 Inverted Silence, Dylan Tallchief & 
; Live Enhancement Suite Contributors
;
; Permission is hereby granted, free of charge, to any person obtaining a copy
; of this software and associated documentation files (the "Software"), to deal
; in the Software without restriction, including without limitation the rights
; to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
; copies of the Software, and to permit persons to whom the Software is
; furnished to do so, subject to the following conditions:
; 
; The above copyright notice and this permission notice shall be included in all
; copies or substantial portions of the Software.
;
; THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
; IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
; FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
; AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
; LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
; OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
; SOFTWARE.

FileReadLine, OutputVar, %A_ScriptDir%\resources\firstrun.txt, 1
;Checks if the first run file exists
;If it doesn't exist; this is the first run, so then do a bunch of initialization stuff.
if (ErrorLevel = 1 or !(OutputVar = 0)){
   If !(InStr(FileExist("resources"), "D")){
      ;if the resources folder doesn't exist, check if there's other stuff in the current folder, otherwise spawn the text box.
      Loop, %A_ScriptDir%\*.*,1,1
      If (A_Index > 3)
      {
         MsgBox,48,Live Enhancement Suite, % "You have placed LES in a directory that contains other files.`n LES will create new files when used for the first time.`n Please move the program to a dedicated directory."
         exitapp
      }
	}
   
   if InStr(splitPath A_ScriptDir, "Windows\Temp") or InStr(splitPath A_ScriptDir, "\AppData\Local\Temp"){
      MsgBox,48,Live Enhancement Suite, % "You executed LES from within your file extraction software.`nThis placed it inside of a temporary cache folder, which will cause it to be deleted by Windows' cleanup routine.`nPlease extract LES into its own folder before proceeding."
      exitapp
   }
   
   ;this part of the code extracts a bunch of resources from the .exe and puts them in the right spot
   FileCreateDir, resources
   
   FileInstall, resources\readmejingle.wav, %A_ScriptDir%\resources\readmejingle.wav
   FileInstall, resources\piano.png, %A_ScriptDir%\resources\piano.png
   FileInstall, resources\piano2.png, %A_ScriptDir%\resources\piano2.png
   FileInstall, resources\pianoblack.png, %A_ScriptDir%\resources\pianoblack.png
   FileInstall, menuconfig.ini, %A_ScriptDir%\menuconfig.ini
   FileInstall, settings.ini, %A_ScriptDir%\settings.ini
   
   MsgBox, 4, Live Enhancement Suite, Welcome to the Live Enhancement Suite!`nWould you like to add the Live Enhancement Suite to startup?`nIt won't do anything when you're not using Ableton Live.`n(This can be changed anytime)
   IfMsgBox Yes
   {
      ;MsgBox You pressed Yes.
      Loop, Read, %A_ScriptDir%\settings.ini, %A_ScriptDir%\settingstemp.ini
      {
         testforstartup := Instr(A_LoopReadLine, "addtostartup")
         If(testforstartup = 1) {
            FileAppend, addtostartup = 1`n, %A_ScriptDir%\settingstemp.ini
            FileAppend, `;`	causes the script to launch on startup`n, %A_ScriptDir%\settingstemp.ini"
         } else  {
            FileAppend, %A_LoopReadLine%`n, %A_ScriptDir%\settingstemp.ini
         }
	  }
      goto, donewithintro
   }
   
   ;MsgBox You pressed No.
   Loop, Read, %A_ScriptDir%\settings.ini, %A_ScriptDir%\settingstemp.ini
   {
      testforstartup := Instr(A_LoopReadLine, "addtostartup")
      If(testforstartup = 1) {
         FileAppend, addtostartup = 0`n, %A_ScriptDir%\settingstemp.ini
         FileAppend, `;`	causes the script to launch on startup`n, %A_ScriptDir%\settingstemp.ini"
      } else  {
         FileAppend, %A_LoopReadLine%`n, %A_ScriptDir%\settingstemp.ini
      }
   }
   donewithintro: ;this is the goto thats being used when the "intro" is done
   FileDelete,%A_ScriptDir%\resources\firstrun.txt
   FileAppend, 0,%A_ScriptDir%\resources\firstrun.txt
   FileDelete, %A_ScriptDir%\settings.ini
   FileMove, %A_ScriptDir%\settingstemp.ini, %A_ScriptDir%\settings.ini
   Sleep, 50
   settimer, tooltipboi, 1
   Sleep, 2
}

FileReadLine, OutputVar, %A_ScriptDir%\resources\firstrun.txt, 2
;msgbox % OutputVar
coolpath := A_ScriptFullPath
if (ErrorLevel = 1 or !(OutputVar = coolpath)){
   ;msgbox, adding reg
   FileReadLine, line1, %A_ScriptDir%\resources\firstrun.txt, 1
   ;msgbox % line1
   FileReadLine, line2, %A_ScriptDir%\resources\firstrun.txt, 2
   if (Errorlevel = 0){
      RegDelete, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers, %line2%
   }
   FileDelete, %A_ScriptDir%\resources\firstrun.txt
   FileAppend, %line1%, %A_ScriptDir%\resources\firstrun.txt
   FileAppend, `n%A_ScriptFullPath%,%A_ScriptDir%\resources\firstrun.txt
   RegWrite, REG_SZ, HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AppCompatFlags\Layers, %A_ScriptFullPath%, ~ HIGHDPIAWARE
}

loop, 1 {
   ;test if configuration files are present
   FileReadLine, OutputVar, settings.ini, 1
   if (ErrorLevel = 1){
      Msgbox, 4, Oops!, % "the settings.ini file is missing and is required for operation. Create new?"
      IfMsgBox Yes
      {
         FileInstall, settings.ini, %A_ScriptDir%\settings.ini
      } else  {
         exitapp
      }
	}
   FileReadLine, OutputVar, menuconfig.ini, 1
   if (ErrorLevel = 1){
      Msgbox, 4, Oops!, % "the menuconfig.ini file is missing and is required for operation. Create new?"
      IfMsgBox Yes
      {
         FileInstall, menuconfig.ini, %A_ScriptDir%\menuconfig.ini
      } else  {
         exitapp
      }
	}
   Outputvar :=  ;
}

sleep, 10

;-----------------------------------;
;		  reading Settings.ini		;
;-----------------------------------;

#include validation/Settings.ahk

; alright, so this section asks the user to update the settings.ini with the one included in the package if some values are missing.
; these are the values I deem "nescesary"
if ((autoadd = "") or (resetbrowsertobookmark = "") or (bookmarkx = "") or (bookmarky = "") or (windowedcompensationpx = "") or (disableloop = "") or (saveasnewver = "") or (usectrlaltsinstead = "")or (usectrlaltsinstead = "") or (middleclicktopan = "") or (addctrlshiftz = "") or (0todelete = "") or (absolutereplace = "") or (smarticon = "") or (pianorollmacro = "") or (pianosearch = "") or (enabledebug = "") or (addtostartup = "")){
   gosub, settingsinibad
}

; this section checks for the remaining variables; ones that were added in recent updates or betas. They aren't really nescesary for the program to function.
; In case you're wondering; missing variables default to a "false" response in AHK - so none of the features with missing settings.ini entries will work until you add them to the file.

; I never bothered to make a dynamic settings.ini file updater. Or some UI thing that would make this entire process more convoluted.
; Things like LES 1.2 and 1.3 were never supposed to happen so I didn't account for them - these are the crappy workarounds.

if ((dynamicreload = "") or (altgrmarker = "") or (enableclosewindow = "") or (vstshortcuts = "") or (scrollspeed = ""))
Msgbox, 4, Oops!, % "It seems your settings.ini file is from an older version of LES.`nYou won't be able to use some of the new features added to the settings without restoring your settings.ini file to its default state. It is recommended you make a backup before you do. Reset settings?"
IfMsgBox Yes
{
   FileDelete, %A_ScriptDir%\settings.ini
   FileInstall, settings.ini, %A_ScriptDir%\settings.ini
   
   MsgBox, 4,Live Enhancement Suite, Would you like to add the Live Enhancement Suite to startup?`n(This can be changed anytime)
   IfMsgBox Yes
   {
      ;MsgBox You pressed Yes.
      Loop, Read, %A_ScriptDir%\settings.ini, %A_ScriptDir%\settingstemp.ini
      {
         testforstartup := Instr(A_LoopReadLine, "addtostartup")
         If(testforstartup = 1) {
            FileAppend, addtostartup = 1`n, %A_ScriptDir%\settingstemp.ini
            FileAppend, `;`	causes the script to launch on startup`n, %A_ScriptDir%\settingstemp.ini"
         } else  {
            FileAppend, %A_LoopReadLine%`n, %A_ScriptDir%\settingstemp.ini
         }
	  }
      goto, donelalalala
   }
   
   ;MsgBox You pressed No.
   Loop, Read, %A_ScriptDir%\settings.ini, %A_ScriptDir%\settingstemp.ini
   {
      testforstartup := Instr(A_LoopReadLine, "addtostartup")
      If(testforstartup = 1) {
         FileAppend, addtostartup = 0`n, %A_ScriptDir%\settingstemp.ini
         FileAppend, `;`	causes the script to launch on startup`n, %A_ScriptDir%\settingstemp.ini"
      } else  {
         FileAppend, %A_LoopReadLine%`n, %A_ScriptDir%\settingstemp.ini
      }
   }
   donelalalala:
   FileDelete,%A_ScriptDir%\resources\firstrun.txt
   FileAppend, 0,%A_ScriptDir%\resources\firstrun.txt
   FileDelete, %A_ScriptDir%\settings.ini
   FileMove, %A_ScriptDir%\settingstemp.ini, %A_ScriptDir%\settings.ini
   Sleep, 50
   settimer, tooltipboi, 1
   Sleep, 2
}

if (scrollspeed = ""){
   ;prevents error from empty variable, in case the user didn't want to reset their settings.ini file during an update
   scrollspeed := 1
}

if (enabledebug = 1){
   ;modifies the tray menu if enabledebug is enabled.
   Menu, Tray, Insert, 1&, Key History, listkeys
   Menu, Tray, Insert, 2&,
   Menu, Tray, Insert, 1&, Log, logstuff
   Menu, Tray, Default, Log
}

setmousedelay -1
setbatchlines -1

loop, 1{
   ;adding to startup (or not)
   if (addtostartup = 1){
      RegWrite, REG_SZ, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Live Enhancement Suite, %A_ScriptDir%\%A_ScriptName%
   }
   if (addtostartup = 0){
      RegDelete, HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run, Live Enhancement Suite
   }
}

SetTimer, watchforopen, 1000

#IfWinActive ahk_exe Ableton Live.+              