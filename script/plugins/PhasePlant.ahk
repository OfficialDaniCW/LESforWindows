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

phaseplantloadosc:
   MouseGetPos, posX, posY
   WinGetPos, wx, wy, wWidth, wHeight
   if(clickcountmodifier = ""){
      clickcountmodifier = 0
   }
   
   quotient := wWidth/wHeight
   clickcount := Floor((-9 * quotient) + 21)
   
   clickcount := clickcount + clickcountmodifier
   if (clickcount < 5){
      clickcount := 5
   }
   if (noisefix = true){
      clickcount := clickcount + 1
   }
   ;msgbox, % "quotient: " quotient "`nclickcount: " clickcount
   
   sweetspot := (wx + (wWidth/2.402))
   topbar := (wy + (wWidth/12.37) + (windowedcompensationpx*(31/48)))
   bottombar := (wy - 5 + (wHeight) - (wWidth/5.43))
   genclickspacing := (bottombar - topbar)/clickcount
   
   MouseMove, sweetspot, (topbar + 30)
   Sendinput {Blind}{WheelDown 600}
   sleep, 3
   Sendinput {Blind}{WheelDown 600}
   sleep, 25
   
   loop, % clickcount {
      if (noisefix = true){
         yea2 := (bottombar + 15 - (A_Index * genclickspacing))
      } else  {
         yea2 := (bottombar - (A_Index * genclickspacing))
      }
      Click, %sweetspot%, %yea2%
      sendinput, {right %rightamt%}
      sendinput, {down %downamt%}
      sendinput, {up %upamt%}
      sendinput, {%ppletter%}
      ; sleep, 200
      sendinput, {return}
      Sendinput {WheelDown 30}
   }
   
   noisefix := false
   ppletter:= ""
   clickcountmodifier := 0
   MouseMove, posX, posY
Return

phaseplanta:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "Phase\sPlant|(?=(\/))", piss)
      if (piss = "Phase Plant"){
         rightamt := 0
         downamt := 1
         upampt := 1
         gosub, phaseplantloadosc
      }
    }
Return

phaseplantn:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "Phase\sPlant|(?=(\/))", piss)
      if (piss = "Phase Plant"){
         rightamt := 0
         downamt := 2
         upampt := 0
         clickcountmodifier := -2
         
         noisefix := true
         gosub, phaseplantloadosc
      }
    }
Return
phaseplants:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "Phase\sPlant|(?=(\/))", piss)
      if (piss = "Phase Plant"){
         rightamt := 0
         downamt := 3
         upampt := 0
         gosub, phaseplantloadosc
      }
    }
Return
phaseplantw:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "Phase\sPlant|(?=(\/))", piss)
      if (piss = "Phase Plant"){
         rightamt := 0
         downamt := 4
         upampt := 0
         gosub, phaseplantloadosc
      }
    }
Return
phaseplantd:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "Phase\sPlant|(?=(\/))", piss)
      if (piss = "Phase Plant"){
         rightamt := 1
         downamt := 1
         upampt := 0
         gosub, phaseplantloadosc
      }
    }
   sendinput, {alt up}
Return
phaseplantf:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "Phase\sPlant|(?=(\/))", piss)
      if (piss = "Phase Plant"){
         rightamt := 1
         downamt := 2
         upampt := 0
         gosub, phaseplantloadosc
      }
    }
Return
phaseplanto:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "Phase\sPlant|(?=(\/))", piss)
      if (piss = "Phase Plant"){
         rightamt := 3
         downamt := 10
         upampt := 0
         ppletter:= "o"
         gosub, phaseplantloadosc
      }
    }
Return

phaseplantloadmod:
   MouseGetPos, posX, posY
   WinGetPos, wx, wy, wWidth, wHeight
   clickcount := 6
   sweetspot := (wx + wWidth - (wWidth/19))
   bottombar := (wy - 5 + (wHeight) - (wWidth/7.79))
   modclickspacing := (sweetspot - wx - 30)/clickcount
   
   MouseMove, sweetspot, bottombar
   Sendinput {WheelDown 600}
   sleep, 3
   Sendinput {WheelDown 600}
   sleep, 25
   
   loop, % clickcount {
      yea2 := (sweetspot - (A_Index * modclickspacing))
      Click, %yea2%, %bottombar%
      mousemove, 1, 3, 0, R
      ; sleep, 100
      ; msgbox, % downamt
      sendinput, {down %downamt%}
      sendinput, {right %rightamt%}
      sendinput, {down %downamt2%}
      Sendinput {Return}
      Sendinput {WheelDown 10}
      ; sleep, 200
   }
   mousemove, posX, posY
Return

phaseplantl:
   if(WinActive("ahk_class AbletonVstPlugClass") or WinActive("ahk_class Vst3PlugWindow")){
      WinGetTitle, wintitleoutput, A
      RegExMatch(wintitleoutput, "Phase\sPlant|(?=(\/))", piss)
      if (piss = "Phase Plant"){
         downamt := 1
         rightamt := 0
         downamt2 := 0
         gosub, phaseplantloadmod
      }
    }
Return
