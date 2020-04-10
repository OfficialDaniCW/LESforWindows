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

#include AhkGlobals.ahk

;-----------------------------------;
;		  Tray menu contents		;
;-----------------------------------;

;this sets up the tray menu
Menu, Tray, NoStandard
Menu, Tray, Add, Configure Settings, settingsini
Menu, Tray, Add, Configure Menu, menuini
Menu, Tray, Add,
Menu, Tray, Add, Donate, monatpls
Menu, Tray, Add,
Menu, Tray, Add, Strict Time, stricttime
Menu, Tray, Add, Check Project Time, requesttime
Menu, Tray, Add,
Menu, Tray, Add, Website, website
Menu, Tray, Add, Manual, Manual
Menu, Tray, Add, Exit, quitnow
Menu, Tray, Default, Exit
Menu, Tray, insert, 9&, Reload, doreload
Menu, Tray, insert, 10&, Pause && Suspend, freeze

Random, randomgen, 1, 13 ;these are the random hover quotes
if (randomgen = 1){
   Menu, Tray, Tip, Ableton Live 2: Electric Boogaloo
}
if (randomgen = 2){
   Menu, Tray, Tip, Super Live Bros: Lost Levels
}
if (randomgen = 3){
   Menu, Tray, Tip, LES is more
}
if (randomgen = 4){
   Menu, Tray, Tip, Live HD Audio Manager
}
if (randomgen = 5){
   Menu, Tray, Tip, Vitableton Enhancement 100mg [Now with extra vitamin C!]
}
if (randomgen = 6){
   Menu, Tray, Tip, hey`, pshh!! hit both shift keys with debug on
}
if (randomgen = 7){
   Menu, Tray, Tip, Do more with LES
}
if (randomgen = 8){
   Menu, Tray, Tip, *Cowbell*
}
if (randomgen = 9){
   Menu, Tray, Tip, OTT.exe
}
if (randomgen = 10){
   Menu, Tray, Tip, Live Sweet
}
if (randomgen = 11){
   Menu, Tray, Tip, 1`.2`, Yahoo!
}
if (randomgen = 12){
   Menu, Tray, Tip, Now for MacOS!
}
if (randomgen = 13){
   Menu, Tray, Tip, The biggest thing since sliced bread
}
randomgen := ;

FileRead, stricttxt, %A_ScriptDir%\resources\strict.txt
if(ErrorLevel = 1){
   stricton := 1
} else  {
   stricton := stricttxt
}
if(stricttxt = 1){
   Menu, Tray, Check, Strict Time
}

;-----------------------------------;
;		  Installation		;
;-----------------------------------;

#include LESInit.ahk

;-----------------------------------;
;		  Hotkeys main		;
;-----------------------------------;
loop, 1{
   ;creating hotkeys
   If (disableloop = 1){
      HotKey, ^+m, midiclip
   }
   HotKey, %pianorollmacro% & ~Lbutton, doubleclick
   if (usectrlaltsinstead = 0){
      Hotkey, ^+s, savenewver
   } else  {
      Hotkey, ^!s, savenewver
   }
   Hotkey, !e, envelopemode
   if (addctrlshiftz = 1){
      Hotkey, ^+z, redo
   }
   if (0todelete = 1){
      Hotkey, ~0, double0delet
   }
   if (altgrmarker = 0){
      Hotkey, RShift & L, quickmarker
   } else  {
      Hotkey, <^>!L, quickmarker
      Hotkey, Ralt & L, quickmarker
   }
   if (enabledebug = 1){
      Hotkey, ~RShift & LShift, cheats
   }
   
   Hotkey, !c, colortracks
   Hotkey, !x, cleartracks
   if (absolutereplace = 1){
      Hotkey, ^!v, absolutev
      Hotkey, ^!d, absoluted
   }
   if (enableclosewindow = 1){
      Hotkey, ^w, closewindow
      Hotkey, ^!w, closeall
   }
   Hotkey, ^b, buplicate
   
   Hotkey, ^+h, directshyper
   
   if(vstshortcuts = 1){
      scaling = 1
      Hotkey, 1, vst1
      Hotkey, 2, vst2
      Hotkey, 3, vst3
      Hotkey, 4, vst4
      Hotkey, 5, vst5
      
      ; depricated phaseplant VST specific shortcuts - the alt key would stick sometimes and that's really annoying.
      ; was mostly a proof of concept anyway
      FileRead, cheatread, %A_ScriptDir%\resources\activecheat.txt
      if(cheatread = "kilohearts"){
         ; you can still enable it with a cheat though; for the people who wanna mess around with it.
         Hotkey, ~!a, phaseplanta
         Hotkey, ~!n, phaseplantn
         Hotkey, ~!s, phaseplants
         Hotkey, ~!w, phaseplantw
         Hotkey, ~!d, phaseplantd
         Hotkey, ~!f, phaseplantf
         Hotkey, ~!o, phaseplanto
         Hotkey, ~!l, phaseplantl
      }
      
      Hotkey, ^z, VSTundo
      Hotkey, ^y, VSTredo
   }
}

gosub, createpluginmenu

;-----------------------------------;
;		  Piano menu contents		;
;-----------------------------------;

loop,1 {
   ;this is where the scale menu is created
   FileRead, cheatread, %A_ScriptDir%\resources\activecheat.txt ;these cheats are hidden jokes; don't mind them.
   if (cheatread = "jazz"){
      Menu, Scales, Add, THE LICK™, thelick
      Menu, Chords, Add, THE LICK™, thelick
      
      Menu, Pianomenu, Add, Scales, :Scales
      Menu, Pianomenu, Add, Chords, :Chords
      goto, skipnormalscales
   }
   if (cheatread = "blackmidi"){
      Menu, AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA, Add, 死, deathmidi
      Menu, Pianomenu, Add, AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA, :AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
      goto, skipnormalscales
   }
   
   ; the actual scale menu is built here
   Menu, Scales, Add, Major/Ionian, majorscale
   Menu, Scales, Add, Natural Minor/Aeolean, minorscale
   Menu, Scales, Add,
   Menu, Scales, Add, Harmonic Minor, minorscaleh
   Menu, Scales, Add, Melodic Minor, minorscalem
   Menu, Scales, Add, Dorian, dorian
   Menu, Scales, Add, Phrygian, phrygian
   Menu, Scales, Add, Lydian, lydian
   Menu, Scales, Add, Mixolydian, mixolydian
   Menu, Scales, Add, Locrian, locrian
   Menu, Scales, Add,
   Menu, Pentatonic Based, Add, Major Pentatonic, majorpentatonic
   Menu, Pentatonic Based, Add, Minor Pentatonic, minorpentatonic
   Menu, Pentatonic Based, Add, Major Blues, BluesMaj
   Menu, Pentatonic Based, Add, Minor Blues, Blues
   Menu, World, Add, Gypsy, Gypsy
   Menu, World, Add, Minor Gypsy, GypsyM
   Menu, World, Add, Arabic/Double Harmonic, Arabic
   Menu, World, Add, Hungarian Minor, HungarianM
   Menu, World, Add, Pelog, Pelog
   Menu, World, Add, Bhairav, Bhairav
   Menu, World, Add, Spanish, Spanish
   Menu, World, Add,
   Menu, World, Add, Hirajōshi, Hirajoshi
   Menu, World, Add, In-Sen, Insen
   Menu, World, Add, Iwato, Iwato
   Menu, World, Add, Kumoi, Kumoi
   Menu, Chromatic, Add, Chromatic/Freeform Jazz, chromatic
   Menu, Chromatic, Add, Wholetone, wholetone
   Menu, Chromatic, Add, Diminished, diminishedscale
   Menu, Chromatic, Add, Dominant Bebop, dominantbebop
   Menu, Chromatic, Add, Super Locrian, Superlocrian
   
   Menu, Chords, Add, Octaves, octaves
   Menu, Chords, Add, Power Chord, pwrchord
   Menu, Chords, Add
   Menu, Chords, Add, Major, maj
   Menu, Chords, Add, Minor, min
   Menu, Chords, Add, Maj7, maj7
   Menu, Chords, Add, Min7, m7
   Menu, Chords, Add, Maj9, maj9
   Menu, Chords, Add, Min9, m9
   Menu, Chords, Add, 7, dominant7
   Menu, Chords, Add, Augmented, aug
   Menu, Chords, Add, Diminished, dim
   Menu, Chords, Add,
   Menu, Chords, Add, Triad (Fold), fold3
   Menu, Chords, Add, Seventh (Fold), fold7
   Menu, Chords, Add, Ninth (Fold), fold9
   
   Menu, Pianomenu, Add, Scales, :Scales
   Menu, Pianomenu, Add, Chords, :Chords
   Menu, Scales, Add, Pentatonic Based, :Pentatonic Based
   Menu, Scales, Add, World, :World
   Menu, Scales, Add, Chromaitc, :Chromatic
   
   skipnormalscales:
}

;-----------------------------------;
;		  Double right click routine		;
;-----------------------------------;

; double right click routine

Loop, 1 {
   *~RButton::
      tildestate := GetKeyState(pianorollmacro)
      if (A_PriorHotkey <> "*~RButton" or A_TimeSincePriorHotkey > 400){
         KeyWait, RButton
         return
      }
      
      Show()
      WinKill, menu launcher
      return  ;end of script's auto-execute section.
      
      return  ;end of double right click loop
      
      ; the menu show routine; which includes the part of the code that uses imagesearch to detect the piano roll on a certain portion of the screen.
      ; I singled out just one area on the screen in order to improve performance.
      ; Image search is actually faster than pixel search, which is why I use 2x2 pixel .pngs to achieve the same goal.
      Show() {
         Global pianosearch
         Global dynamicreload
         Global tildestate
         SetTitleMatchMode, 2
         WinGetPos, wx, wy, wWidth, wHeight, Ableton Live
         coolvar := ((wHeight/3.5) + wy)
         coolvar2 := (wHeight - 100 + wy)
         coolvar3 := ((wWidth/3.4) + wx)
         if (!MX && !MY)MouseGetPos, MX, MY
         if (pianosearch = 1){
            ImageSearch, x1, y1, (wx + 8), coolvar, coolvar3, coolvar2, %A_ScriptDir%\resources\piano.png
            ;msgbox,0,ha, % "Top left x[" (wx + 8) "] y[" coolvar "] and then bottom right x[" coolvar3 "] y[" coolvar2 "]"
            if (Errorlevel = 0){
               Imagesearch, a1, b1, x1, (y1 + 5), x1, (y1 + 105), %A_ScriptDir%\resources\pianoblack.png
               if (Errorlevel = 0){
                  ;mousemove, coolvar3, 500
                  Menu, pianomenu, Show, % MX, % MY
                  Return
               }
               if (dynamicreload = 1){
                  gosub, createpluginmenu
               }
               Menu, ALmenu, Show, % MX, % MY
               Return
            }
            ImageSearch, x1, y1, (wx + 8), coolvar, coolvar3, coolvar2, %A_ScriptDir%\resources\piano2.png
            if (Errorlevel = 0){
               Imagesearch, a1, b1, x1, (y1 + 5), x1, (y1 + 105), %A_ScriptDir%\resources\pianoblack.png
               if (Errorlevel = 0){
                  ;mousemove, coolvar3, 500
                  Menu, pianomenu, Show, % MX, % MY
                  Return
               }
               if (dynamicreload = 1){
                  gosub, createpluginmenu
               }
               Menu, ALmenu, Show, % MX, % MY
               Return
            } else  {
               if (dynamicreload = 1){
                  gosub, createpluginmenu
               }
               Menu, ALmenu, Show, % MX, % MY
            }
		 }
         
         if (pianosearch = 0){
            if GetKeyState("LShift") = 0{
               gosub, createpluginmenu
               Menu, ALmenu, Show, % MX, % MY
            }
            if GetKeyState("LShift") = 1{
               Menu, pianomenu, show, % MX, % MY
            }
		}
	}
} ;ends whole loop
Return

;-----------------------------------;
;		  Hotkeys Mouse		;
;-----------------------------------;
; I'm using this syntax here; rather than "Hotkey", because for some reason this works on MX master mice and the "Hotkey" approach does not.
; I'm not sure if I'm doing something wrong but this is probably a bug; AHK pease fix?
; these are after the double right click routine because it ends the auto execute section of the script.
; If they were higher up, the nescesary "Return" would end the auto-execute section of the script early.

MButton::
   if (middleclicktopan = 1){
      Send {LControl down}{LAlt down}{LButton down}
   }
Return
MButton Up::
   if (middleclicktopan = 1){
      Send {LControl up}{LAlt up}{LButton up}
   }
Return

$WheelDown::
   MouseGetPos,,,guideUnderCursor
   WinGetTitle, WinTitle, ahk_id %guideUnderCursor%
   if(InStr(WinTitle, "Ableton") != 0){
      SendInput, {WheelDown %scrollspeed%}} else  {
      SendInput, {WheelDown 1}
   }
Return

$WheelUp::
   MouseGetPos,,,guideUnderCursor
   WinGetTitle, WinTitle, ahk_id %guideUnderCursor%
   if(InStr(WinTitle, "Ableton") != 0){
      SendInput, {WheelUp %scrollspeed%}
	  } else  {
      SendInput, {WheelUp 1}
   }
Return

pause::
   ^F1::
   Suspend, Permit
   if (A_IsPaused = 1){
      ;traytip, "Live Enhancement Suite", "LES is unpaused", 0.1, 16
      Menu, Tray, Rename, Unpause && Unsuspend, Pause && Suspend
   } else  {
      ;traytip, "Live Enhancement Suite", "LES is paused", 0.1, 16
      Menu, Tray, Rename, Pause && Suspend, Unpause && Unsuspend
   }
   Pause, Toggle, 1
   Suspend, Toggle
Return

;-----------------------------------;
;		  reading menuconfig.ini		;
;-----------------------------------;

; Below here is the function that interprets the stuff inside of the menuconfig.ini file and turns it into a functional autohotkey menu.

; I made up the LES menu syntax improve accessibility. In hindsight I could've done some things better, but it's too late for that now.
; If I ever decide to overhaul this (or if someone else does), I would try to make a converter that can convert people's old configurations into a new syntax, along with the update.
; Seriously, I've seen people add a thousand items. That must take for ever...

#include validation/MenuConfig.ahk

;-----------------------------------;
;		  Opening a plugin		;
;-----------------------------------;

openplugin: ;you would think consistently typing something in the ableton search bar would be easy
loop, 1{
   Send,{ctrl down}{f}{ctrl up}
   Sendinput % queryname
   WinWaitActive, ExcludeText - ExcludeTitle, , 0.5 ; prevents the keystrokes from desynchronizing when ableton lags during the search query.
   
   
   if (pressingalt = 1) {
      if (GetKeyState("Lctrl", p) = 0){
         tempautoadd := autoadd
      }
	}
   if (GetKeyState("Lctrl", p) = 1){
      if (autoadd = 1){
         tempautoadd := 0
      } else  {
         tempautoadd := 1
      }
	} else  {
      tempautoadd := autoadd
   }
   
   
   If (tempautoadd = 1){
      sleep, 112
      Send,{down}{enter}
   } else  {
      goto, skipautoadd
   }
   MouseGetPos, posX, posY
   If (resetbrowsertobookmark = 1){
      ;this is a feature barely anyone uses, but you can have LES click a collection or something after you hit a menu item.
      SetTitleMatchMode, 2
      WinGetPos, wx, wy, wWidth, wHeight, Ableton
      CoordMode, Pixel, Screen
      CoordMode, Mouse, Screen
      PixelGetColor, titlebarcolor, (wx + 10), (wy + 38)
      If (titlebarcolor = "0xFFFFFF") || (titlebarcolor = "0xF2F2F2") || (titlebarcolor = "0x2F2F2F") || (titlebarcolor = "0xFFFFFFFF") || (titlebarcolor = "0xF2F2F2F2") || (titlebarcolor = "0x2F2F2F2F"){
         ; the colours are used to detect if live is in fullscreen or in windowed mode.
         
         ;msgbox, titlebar found
         coolclicky := bookmarky + windowedcompensationpx + wy
         coolclickx := bookmarkx + wx
      } else  {
         coolclicky := bookmarky + wy
         coolclickx := bookmarkx + wx
      }
      sleep, 1
      Click, %coolclickx%, %coolclicky%, 1
      MouseMove, posX, posY, 0
   }
   SendInput, {Esc}
   SetTitleMatchMode, RegEx
   
   querynameclean := RegExReplace(queryname, "['""]+", "")
   StringLower, querynameclean, querynameclean
   ;msgbox, % querynameclean
   if (querynameclean = "analog" or querynameclean = "collision" or querynameclean = "drum rack" or querynameclean = "electric" or querynameclean = "external instrument" or querynameclean = "impulse" or querynameclean = "instrument rack" or querynameclean = "operator" or querynameclean = "sampler" or querynameclean = "simpler" or querynameclean = "tension" or querynameclean = "wavetable") or (querynameclean = "amp") or (querynameclean = "audio effect rack") or (querynameclean = "auto filter") or (querynameclean = "auto pan") or (querynameclean = "beat repeat") or (querynameclean = "cabinet") or (querynameclean = "chorus") or (querynameclean = "compressor") or (querynameclean = "corpus") or (querynameclean = "drum buss") or (querynameclean = "dynamic tube") or (querynameclean = "echo") or (querynameclean = "eq eight") or (querynameclean = "eq three") or (querynameclean = "erosion") or (querynameclean = "external audio effect") or (querynameclean = "filter delay") or (querynameclean = "flanger") or (querynameclean = "frequency shifter") or (querynameclean = "gate") or (querynameclean = "glue compressor") or (querynameclean = "grain delay") or (querynameclean = "limiter") or (querynameclean = "looper") or (querynameclean = "multiband dynamics") or (querynameclean = "overdrive") or (querynameclean = "pedal") or (querynameclean = "phaser") or (querynameclean = "ping pong delay") or (querynameclean = "redux") or (querynameclean = "resonators") or (querynameclean = "reverb") or (querynameclean = "saturator") or (querynameclean = "simple delay") or (querynameclean = "delay") or (querynameclean = "spectrum") or (querynameclean = "tuner") or (querynameclean = "utility") or (querynameclean = "vinyl distortion") or (querynameclean = "vocoder") or (InStr(querynameclean, ".adv") != 0){
      ; I could do this with an array instead but I'm too lazy and this works too so enjoy this 15km 'if' statement
      WinWaitActive, ExcludeText - ExcludeTitle, , 0.5
      return
   } else  {
      WinWaitActive, ahk_class (AbletonVstPlugClass|Vst3PlugWindow),,12
      WinGetTitle, piss, ahk_class (AbletonVstPlugClass|Vst3PlugWindow)
   }
   if (piss != "") {
      SetTitleMatchMode, 2
      WinActivate, Ableton
      SendInput, {Esc}
      sleep, 1
      WinActivate, %piss%
   } else  {
      SetTitleMatchMode, 2
   }
   skipautoadd:
   piss :=  ;
   wTitle :=  ;
   wWidth :=  ;
   wHeight :=  ;
   wx :=  ;
   wy :=  ;
}
Return

;-----------------------------------;
;		  Tray menu actions	& Readme	;
;-----------------------------------;

loop, 1 {
   ; (again, loop, 1 does nothing)
   
   listkeys: ;these are built in AHK GUIs, so this simple command needed to be added to the tray menu as well.
   KeyHistory
   Return
   
   logstuff:
   listlines
   Return
   
   settingsini:
   run, %A_ScriptDir%\settings.ini
   Return
   
   menuini:
   run, %A_ScriptDir%\menuconfig.ini
   Return
   
   doreload:
   FileDelete,%A_ScriptDir%\resources\activecheat.txt
   gosub coolfunc
   Reload
   Return
   
   stricttime: ;this is what happens when you click "strict time"
   if (stricton = 0){
      stricton := 1
      Menu, Tray, Check, Strict Time
      FileDelete,%A_ScriptDir%\resources\strict.txt
      FileAppend, 1,%A_ScriptDir%\resources\strict.txt
      
      
      settitlematchmode, regex
      if !(WinActive("ahk_exe Ableton Live")){
         SetTimer, Clock, Delete ; deleting a clock that increases the timer when ableton is unfocussed.
      }
      settitlematchmode, 2
   } else  if (stricton = 1) {
      stricton := 0
      FileDelete,%A_ScriptDir%\resources\strict.txt
      FileAppend, 0,%A_ScriptDir%\resources\strict.txt
      Menu, Tray, Uncheck, Strict Time
      if (WinExist("ahk_exe Ableton Live ") != 0) and (trackname != ""){
         SetTimer, Clock, 1000 ; creating a clock that increases the timer.
      }
	}
   Return
   
   freeze:
   if (A_IsPaused = 1){
      Menu, Tray, Rename, Unpause && Unsuspend, Pause && Suspend
   } else  {
      Menu, Tray, Rename, Pause && Suspend, Unpause && Unsuspend
   }
   
   Suspend, Toggle
   Pause
   Return
   
   website:
   run, https://enhancementsuite.me/
   return
   
   manual:
   run, https://docs.enhancementsuite.me/
   Return
   
   monatpls: ;please gib monat
   run, https://paypal.me/enhancementsuite
   Return
   
   quitnow:
   exitapp
   Return
}

; the readme technically isn't a tray menu action, since it's no longer located there. It's now included in the plugin menu to attract more attention.
; the marker is still here though because idk where else to put it.

readme:
   SoundPlay, %A_ScriptDir%\resources\readmejingle.wav
   MsgBox, 0, Readme, % "Welcome to the Live Enhancement Suite created by @InvertedSilence & @DylanTallchief 🐦`nDouble right click to open up the custom plug-in menu.`nClick on the LES logo in the menu bar to add your own plug-ins, change settings, and read our manual if you're confused.`nHappy producing : )"
Return

;-----------------------------------;
;		  Hotkey actions		;
;-----------------------------------;

midiclip:
   Sendinput, {ctrl down}{ShiftDown}{m}{ShiftUp}{ctrl up}
   sleep, 1
   Sendinput, {ctrl down}{j}{ctrl up}
return

doubleclick:
   Click Down
   KeyWait, Lbutton
   Click Up
   if (pressingshit = 1){
      if (GetKeyState("LShift", p) = 0){
         stampselect := ""
      }
	}
   if (GetKeyState("LShift", p) = 1){
      pressingshit := 1
   } else  {
      pressingshit := 0
   }
   if (stampselect != ""){
      gosub, % stampselect
   }
return

savenewver:
   ; this section does the ctrl+alt+s command and also includes the section that tries to parse the filename in a way that makes sense.
   ; I'm not very good at these, but this spaghetti approach works 99% of the time, so it would be ok.
   ; Ever since LES 1.0, it's gone through many different iterations.
   Errorlevel := ""
   Sendinput, ^+s
   SetTitleMatchMode, 2
   WinWaitActive, ahk_class #32770,,2 ;this waits for the save dialog thing to show up.
   if (ErrorLevel = 1){
      Return
   }
   If (saveasnewver = 1){
      BlockInput, On
      ClipSaved := ClipboardAll
      clipboard =  ;
      SendInput, {Ctrl down}{a}{Ctrl up}
      SendInput, {Ctrl down}{c}{Ctrl up}
      ClipWait  ;
      stuff := Clipboard
      Clipboard := ClipSaved
      
      if (InStr(Stuff, ".als")){
         Sendinput, {right}
         sendinput, {Backspace 4}
         alsfound := 1
         StringTrimRight, Stuff, Stuff, 4
      } else  {
         alsfound := 0
      }
      
      if (Stuff = "Untitled"){
         ;safeguard for if the user is trying to do something really unnescesary
         MsgBox, 4, Live Enhancement Suite, Your project name is "Untitled".`nAre you sure you want to save it as a new version?
         IfMsgBox Yes
         {
            goto enduntitledcycle
         } else  {
            Return
         }
		}
      enduntitledcycle:
      ; I don't know if this goto was nescesary or if it was a workaround to fix AHK jank - ...now I'm scared to remove it.
      
      EndPos := InStr(Stuff, "_", 0, 0) -1
      Stuff := SubStr(Stuff, (EndPos))
      
      if (InStr(Stuff, "_"))
      {
         testforletterend := (SubStr(stuff, (0), 1))
         ;Msgbox % testforletterend
         if testforletterend is alpha
         {
            ;StringTrimRight, stuff, stuff, (1)
            ;stuff .= "."
            alphacharatend := 1
            ;numberstuff := % "_" . numberstuff
         }
         numberstuff := RegExReplace(stuff, "^.*?_")
         numberstuff := RegExReplace(numberstuff, "[^0-9, .]")
      } else  {
         Numberstuff =   ;
         goto nounderscore
      }
      
      if (extentioncompensation = 0){
         StringTrimRight, numberstuff, numberstuff, 1
      }
      Versionlength := StrLen(numberstuff)
      if (alphacharatend = 1){
         Versionlength := Versionlength + 1
      }
      
      nounderscore:
      if (numberstuff = "") ; if the string is empty make it 1 and then tell it to skip deletion
      {
         numberstuff := "1"
         skipflag := 1
      }
      numberstuff := numberstuff + 1 ; add 1 to the version number
      if (RegExMatch(numberstuff, "[., 0{5}]")) ; if theres a dot delete everything until after and including the dot
      {
         SplitPath, numberstuff,,,,numberstuff
      }
      
      if !(InStr(Stuff, "_"))
      {
         numberstuff := % "_" . numberstuff
      }
      
      Sendinput, {Right 1}
      
      if (skipflag = 1){
         goto skipdel1
      }
      
      sleep, 5
      Sendinput, {ShiftDown}{Left %Versionlength%}{ShiftUp}
      SendInput, {BackSpace}
      
      sleep, 5
      skipdel1:
      Sendinput % numberstuff
      Sendinput, {Enter}
      skipflag := 0
      alphacharatend := 0
      numberstuff =   ;
      stuff =   ;
      Blockinput, Off
      Return
   }
return

envelopemode:
   MouseGetPos,,,guideUnderCursor
   WinGetTitle, WinTitle, ahk_id %guideUnderCursor%
   if(InStr(WinTitle, "Ableton") != 0){
      WinGetPos, wx, wy, wWidth, wHeight, Ableton Live
      MouseGetPos, posX, posY
      coolvar4 := wy + wHeight - 47
      coolvar5 := wx + 54
      loop, 4{
         ;pixelgetcolor, coolcolor, (%coolvar5% + 50
         click, %coolvar5%, %coolvar4%
         coolvar4 := coolvar4 - 18
         coolvar5 := coolvar5 + 18
      }
      Mousemove, posX, posY
      wTitle :=  ;
      wWidth :=  ;
      wHeight :=  ;
      wx :=  ;
      wy :=  ;
   }
Return

double0delet:
   if (A_PriorHotkey <> "~0" or A_TimeSincePriorHotkey > 200){
      KeyWait, 0
      return
   }
   send {delete}
return

redo:
   send {ctrl down}{y down}{ctrl up}{y up}
   if(vstshortcuts := 1){
      gosub, VSTredo
   }
Return

quickmarker:
   WinGetActiveTitle, wintitleoutput
   if !(InStr(title, "Live 9", CaseSensitive := false) = 0){
      WinMenuSelectItem,,, 3&, 13&
   } else  {
      WinMenuSelectItem,,, 3&, 14&
   }
return

colortracks:
   MouseGetPos,,,guideUnderCursor
   WinGetTitle, WinTitle, ahk_id %guideUnderCursor%
   if(InStr(WinTitle, "Ableton") != 0){
      Click, Right
      sleep, 20
      SendInput {up 2}
      SendInput {Enter}
   }
Return

cleartracks:
   MouseGetPos,,,guideUnderCursor
   WinGetTitle, WinTitle, ahk_id %guideUnderCursor%
   if(InStr(WinTitle, "Ableton") != 0){
      Click, Right
      sleep, 20
      SendInput {down 12}{enter}{delete}
   }
Return

absolutev:
   MouseGetPos,,,guideUnderCursor
   WinGetTitle, WinTitle, ahk_id %guideUnderCursor%
   if(InStr(WinTitle, "Ableton") != 0){
      BlockInput, On
      sendinput, {ctrl down}{v}{ctrl up}
      sendinput, {backspace}
      sendinput, {ctrl down}{v}{ctrl up}
      Blockinput, Off
   }
Return

absoluted:
   MouseGetPos,,,guideUnderCursor
   WinGetTitle, WinTitle, ahk_id %guideUnderCursor%
   if(InStr(WinTitle, "Ableton") != 0){
      BlockInput, On
      ClipSaved := ClipboardAll
      clipboard =  ;
      send {ctrl down}{c}{ctrl up}
      send {ctrl down}{d}{ctrl up}
      send {backspace}
      send {ctrl down}{v}{ctrl up}
      Clipboard := ClipSaved ; restore clipboard
      Blockinput, Off
   }
Return

closewindow:
   Winget processnameoutput, ProcessName
   WinGetClass classnameoutput
   WinGetTitle, wintitleoutput
   SetTitleMatchMode, 3
   if (RegExMatch(processnameoutput, "Ableton")){
      if (RegExMatch(classnameoutput, "AbletonVstPlugClass") or RegExMatch(classnameoutput, "Vst3PlugWindow")){
         Winclose, %wintitleoutput%
         SetTitleMatchMode, 2
      }
	}
return

closeall:
   DetectHiddenWindows, Off
   WinGet windows, List
   SetTitleMatchMode, 3
   Loop %windows%
   {
      id := windows%A_Index%
      Winget processnameoutput, ProcessName, ahk_id %id%
      WinGetClass classnameoutput, ahk_id %id%
      if (RegExMatch(processnameoutput, "Ableton")){
         If (RegExMatch(classnameoutput, "AbletonVstPlugClass") or RegExMatch(classnameoutput, "Vst3PlugWindow")){
            Winclose, ahk_id %id%
            ;windowlist .= wt . "`n"
         }
	  }
	}
   
   SetTitleMatchMode, 2
Return

buplicate: ;brought to you by dylan tallchief
if (A_PriorHotkey != "^b" or A_TimeSincePriorHotkey > 1800 or A_PriorKey = Lbutton){
   ; Too much time between presses, so this isn't a double-press.
   send {ctrl down}{d 7}{ctrl up}
   return
}
send {ctrl down}{d 8}{ctrl up}
return

absolutelynothing:
   
return

directshyper: ;backup shortcut in case the double right click routine fails someone
Show()
Return

;-----------------------------------;
;		  Plugin specific hotkeys		;
;-----------------------------------;

#include plugins/Plugins.ahk

;-----------------------------------;
;		  Cheats/Jokes		;
;-----------------------------------;

#include EasterEggs.ahk

settingsinibad:
   Msgbox, 4, Oops!, % "The settings.ini file is outdated or invalid and is required for operation. reset?`n(Make sure to make a copy of the old one before you click yes!)"
   IfMsgBox Yes
   {
      FileDelete, %A_ScriptDir%\settings.ini
      FileInstall, settings.ini, %A_ScriptDir%\settings.ini
   } else  {
      Msgbox, The program will shut down now.
      exitapp
   }
Return

;-----------------------------------;
;		  Timers/Clocks		;
;-----------------------------------;

#include Timers.ahk

; Scales
#include Scales.ahk

; https://stackoverflow.com/questions/46432447/how-do-i-remove-duplicates-from-an-autohotkey-array
trimArray(arr) {
   hash := {}, newArr := []
   
   for e, v in arr
   if (!hash[v])hash[(v)] := 1, newArr.push(v)
   
   return newArr
}              