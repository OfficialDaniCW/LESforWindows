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

#include plugins/Sylenth.ahk

vst1:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "^Serum|(?=(\/))", piss)
      if (piss = "Serum"){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth*2/9))
         yea2 := (wy + (windowedcompensationpx*(31/48) + 20))
         Click, %yea1%, %yea2%, 1
         ; sleep, 200
         MouseMove, posX, posY
         yea1 := ""
         yea2 := ""
         Return
      }
      RegExMatch(wintitleoutput, "^Sylenth1|(?=(\/))", piss)
      if (piss = "Sylenth1"){
         gosub, Sylenth
         Return
      }
      RegExMatch(wintitleoutput, "^Massive|(?=(\/))", piss)
      if (piss = "Massive"){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth*20/958))
         yea2 := (wy + (windowedcompensationpx*(31/48) + (wHeight*72/680)))
         Click, %yea1%, %yea2%, 1
         MouseMove, posX, posY
         yea1 := ""
         yea2 := ""
      }
	} else  {
      sendinput, {Blind}{1}
   }
Return

vst2:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "^Serum|(?=(\/))", piss)
      if (piss = "Serum"){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth*25/90))
         yea2 := (wy + (windowedcompensationpx*(31/48) + 20))
         Click, %yea1%, %yea2%, 1
         ; sleep, 200
         MouseMove, posX, posY
         yea1 := ""
         yea2 := ""
         Return
      }
      RegExMatch(wintitleoutput, "^Sylenth1|(?=(\/))", piss)
      if (piss = "Sylenth1"){
         gosub, Sylenth
         Return
      }
      RegExMatch(wintitleoutput, "^Massive|(?=(\/))", piss)
      if (piss = "Massive"){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth*20/958))
         yea2 := (wy + (windowedcompensationpx*(31/48) + (wHeight*186/680)))
         Click, %yea1%, %yea2%, 1
         MouseMove, posX, posY
         yea1 := ""
         yea2 := ""
      }
	} else  {
      sendinput, {Blind}{2}
   }
Return

vst3:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "^Serum|(?=(\/))", piss)
      if (piss = "Serum"){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth*325/900))
         yea2 := (wy + (windowedcompensationpx*(31/48) + 20))
         Click, %yea1%, %yea2%, 1
         ; sleep, 200
         MouseMove, posX, posY
         yea1 := ""
         yea2 := ""
      }
      RegExMatch(wintitleoutput, "^Massive|(?=(\/))", piss)
      if (piss = "Massive"){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth*20/958))
         yea2 := (wy + (windowedcompensationpx*(31/48) + (wHeight*300/680)))
         Click, %yea1%, %yea2%, 1
         MouseMove, posX, posY
         yea1 := ""
         yea2 := ""
      }
	} else  {
      sendinput, {Blind}{3}
   }
Return

vst4:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "^Serum|(?=(\/))", piss)
      if (piss = "Serum"){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth*4/9))
         yea2 := (wy + (windowedcompensationpx*(31/48) + 20))
         Click, %yea1%, %yea2%, 1
         ; sleep, 200
         MouseMove, posX, posY
         yea1 := ""
         yea2 := ""
      }
      RegExMatch(wintitleoutput, "^Massive|(?=(\/))", piss)
      if (piss = "Massive"){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth*20/958))
         yea2 := (wy + (windowedcompensationpx*(31/48) + (wHeight*420/680)))
         Click, %yea1%, %yea2%, 1
         MouseMove, posX, posY
         yea1 := ""
         yea2 := ""
      }
	} else  {
      sendinput, {Blind}{4}
   }
Return

vst5:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "^Massive|(?=(\/))", piss)
      if (piss = "Massive"){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth*20/958))
         yea2 := (wy + (windowedcompensationpx*(31/48) + (wHeight*530/680)))
         Click, %yea1%, %yea2%, 1
         MouseMove, posX, posY
         yea1 := ""
         yea2 := ""
      }
	} else  {
      sendinput, {Blind}{5}
   }
Return

#include plugins/PhasePlant.ahk

VSTundo:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "FabFilter\sPro-Q\s3|(?=(\/))", piss)
      if (piss = "FabFilter Pro-Q 3") and (scaling = 1){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         quotient := wWidth/wHeight
         if (quotient = "1.967914"){
            ;mini
            fraction := 13/30
         }
         if (quotient = "1.569444"){
            ;small
            fraction := 12/30
         }
         if (quotient = "1.582038"){
            ;medium
            fraction := 12/31
         }
         if (quotient = "1.592760"){
            ;large
            fraction := 12/30
         }
         if (quotient = "1.602108"){
            ;extra large
            fraction := 12/29
         }
         if (fraction = ""){
            msgbox, % "If you're seeing this, it means that Midas didn't properly think about the way VST plugins deal with scaling at your current display resolution.`nPerhaps you have the plugin (or your OS) set to a custom scaling amount?`nIt is recommended to disable the VST specific shortcuts in the settings.ini if you want to continue to use custom scaling, since they probably won't work right anyway..`n`n this shortcut will temporarily be disabled."
            scaling := 0
            Return
         }
         yea1 := (wx + (wWidth * fraction))
         yea2 := (wy + (windowedcompensationpx*(31/48) + 20))
         Click, %yea1%, %yea2%
         fraction := ""
         yea1 := ""
         yea2 := ""
         mousemove, posX, posY
      }
      
      RegExMatch(wintitleoutput, "Kick\s2|(?=(\/))", piss)
      if (piss = "Kick 2") and (scaling = 1){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth / 3.40))
         yea2 := (wy + (windowedcompensationpx*(31/48) + 85))
         Click, %yea1%, %yea2%
         yea1 := ""
         yea2 := ""
         mousemove, posX, posY
         Return
      }
	}
   sendinput {ctrl down}{z}{ctrl up}
   ; my own dimension quotients (can be added to later!)
   ; mini 1.967914
   ; small 1.569444
   ; medium 1.582038
   ; large 1.592760
   ; extra large 1.602108
Return

VSTredo:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "FabFilter\sPro-Q\s3|(?=(\/))", piss)
      if (piss = "FabFilter Pro-Q 3") and (scaling = 1){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         quotient := wWidth/wHeight
         ; MsgBox, % quotient
         if (quotient = "1.967914"){
            ;mini
            fraction := 14/30
         }
         if (quotient = "1.569444"){
            ;small
            fraction := 13/30
         }
         if (quotient = "1.582038"){
            ;medium
            fraction := 13/31
         }
         if (quotient = "1.592760"){
            ;large
            fraction := 12/28
         }
         if (quotient = "1.602108"){
            ;extra large
            fraction := 13/30
         }
         if (fraction = ""){
            msgbox, % "If you're seeing this, it means that Midas didn't properly think about the way Pro-Q deals with scaling at your current display resolution.`nThe command has been disabled to prevent misfired keystrokes.`nPlease contact me on twitter so I can fix the bug!"
            Hotkey, ~^y, VSTredo, Off
            Return
         }
         yea1 := (wx + (wWidth * fraction))
         yea2 := (wy + (windowedcompensationpx*(31/48) + 20))
         Click, %yea1%, %yea2%
         fraction := ""
         yea1 := ""
         yea2 := ""
         mousemove, posX, posY
      }
      
      RegExMatch(wintitleoutput, "Kick\s2|(?=(\/))", piss)
      if (piss = "Kick 2") and (scaling = 1){
         MouseGetPos, posX, posY
         WinGetPos, wx, wy, wWidth, wHeight
         yea1 := (wx + (wWidth / 3.19))
         yea2 := (wy + (windowedcompensationpx*(31/48) + 85))
         Click, %yea1%, %yea2%
         yea1 := ""
         yea2 := ""
         mousemove, posX, posY
         Return
      }
	}
   	sendinput {ctrl down}{y}{ctrl up}
Return
