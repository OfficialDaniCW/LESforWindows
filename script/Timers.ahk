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

watchforclose:
   SetTitleMatchMode RegEx
   if (WinActive(ahk_exe "Ableton\sLive.+") = 0){
      ;msgbox, ableton is now offline
      if (smarticon = 1){
         Menu, Tray, NoIcon
      }
      Send {LControl up}{LAlt up}{LButton up}
      SetTimer, watchforopen, 1000
      if (stricton = 1){
         SetTimer, Clock, Delete
      }
      SetTimer, watchforclose, Delete
   }
Return

watchforopen:
   SetTitleMatchMode RegEx
   if (WinActive(ahk_exe "Ableton\sLive.+") != 0){
      ;msgbox, ableton is online
      if (smarticon = 1){
         Menu, Tray, Icon
      }
      SetTimer, watchforclose, 1000
      SetTimer, Clock, 1000
      SetTimer, watchforopen, Delete
   }
Return

coolfunc:
   ;msgbox, % "coolfunc"
   if (trackname != ""){
      oldtrackname := trackname
      FileCreateDir, %A_ScriptDir%\resources\time\
      
      FileReadLine, OutputVar, %A_ScriptDir%\resources\time\%oldtrackname%_time.txt, 1
      if !(ErrorLevel = 1){
         ;msgbox, % "file exists"
         FileDelete, %A_ScriptDir%\resources\time\%oldtrackname%_time.txt
      }
      FileAppend, % timer_%trackname%, %A_ScriptDir%\resources\time\%oldtrackname%_time.txt
   }
   
   trackname := ""
   DetectHiddenWindows, Off
   windows := ;
   WinGet windows, List
   Loop %windows% {
      id := windows%A_Index%
      WinGetTitle wt, ahk_id %id%
      if (RegExMatch(wt, "- Ableton Live ") != 0){
         mainwindowtitle := wt
         if (RegExMatch(wt, "\[") != 0 && RegExMatch(wt, "\[") != "" ){
            trackname := RegExReplace(wt, "([^\[]+)\[", "")
            trackname := RegExReplace(trackname, "\]\s\-\s([^\]]+)$", "")
            trackname := RegExReplace(trackname, "[\W_]+", "_")
         } else  {
            trackname := "unsaved_project"
         }
      }
    }
   if (trackname = ""){
      Return
   }
   
   FileReadLine, OutputVar, %A_ScriptDir%\resources\time\%trackname%_time.txt, 1
   if !(ErrorLevel = 1){
      timer_%trackname% := OutputVar
   } else  {
      return
   }
return

Clock:
   if (trackname = ""){
      gosub coolfunc
   }
   SetTitleMatchMode, 2
   if (trackname = "unsaved_project"){
      if (WinExist("] - Ableton Live ")){
         ;Msgbox, % "track title changed! 1"
         gosub coolfunc
      }
    }
   else if !(WinExist("[" trackname "] - Ableton Live ")){
      ;MsgBox, % "track title changed! 2"
      gosub coolfunc
   }
   
   if (timer_%trackname% = ""){
      timer_%trackname% := 0
   }
   timer_%trackname% := timer_%trackname% + 1
Return

requesttime:
   gosub coolfunc
   if (trackname = ""){
      MsgBox,48,Live Enhancement Suite, % "There was no open project detected.`nPlease open or focus Live and try again."
      Return
   }
   currenttime := ""
   
   if (timer_%trackname% = 0 or timer_%trackname% = ""){
      currenttime := "0 hours, 0 minutes, and 0 seconds"
   } else  {
      hh := floor(timer_%trackname%/3600)
      mm := floor(timer_%trackname%/60 - (hh*60))
      ss := floor(timer_%trackname% - (hh*3600) - (mm*60))
      if (hh = 1){
         hhh := "hour"
      } else  {
         hhh := "hours"
      }
      if (mm = 1){
         mmm := "minute"
      } else  {
         mmm := "minutes"
      }
      currenttime := hh " " hhh ", " mm " " mmm ", and " ss " seconds"
   }
   
   if (trackname = "unsaved_project"){
      customboxtext := "The total time you've spent in unsaved projects is`n"
   } else  {
      tracknamepretty := RegExReplace(trackname, "[\__]+", " ")
      customboxtext := "the total time you've spent in the [" tracknamepretty "] project is`n"
   }
   
   Gui timemenu:+LastFoundExist
   IfWinExist
   {
      Gui timemenu: Destroy
   }
   
   Gui timemenu: -MaximizeBox -MinimizeBox +ToolWindow
   Gui timemenu: Font, Q5
   space = y+2
   Gui timemenu: Add, Text, x20 y30 vMyText Right, % customboxtext
   Gui timemenu: Add, Text, x20 %space% vMyText1, % currenttime "."
   Gui timemenu: Add, Button, x280 y75 w80 gInfo, Reset Time
   Gui timemenu: Add, Button, x+15 w80 gName default, Ok
   Gui timemenu: Show, Restore w470 h110, Live Enhancement Suite , Time
Return

Info:
   Gui timemenu: Destroy
   MsgBox, 4, Live Enhancement Suite, Are you sure?
   IfMsgBox Yes
   {
      timer_%trackname% := ""
      FileReadLine, OutputVar, %A_ScriptDir%\resources\time\%trackname%_time.txt, 1
      if !(ErrorLevel = 1){
         FileDelete, %A_ScriptDir%\resources\time\%oldtrackname%_time.txt
      }
    }
Return

GuiClose:
   GuiEscape:
   Gui timemenu: Destroy
Return

Name:
   Gui timemenu: Destroy
Return

Return

checkshift:
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
Return

tooltipboi:
   SetTitleMatchMode, 2
   WinWaitActive, Ableton
   winget, ProcessID, PID, A
   if !(hProcess := DllCall("OpenProcess", "uint", 0x0400, "int", 0, "uint", ProcessID, "ptr")){
      MsgBox, 0, Live Enhancement Suite Admin Warning, % "Hey there!`n`nIt seems you're running Ableton Live as an Administrator, and this might prevent LES from doing anything. Please run Ableton Live without elevated permissions (since it allows you to import files from your desktop etc).`nIf you have a good reason to run Ableton Live as an Admin, please run LES as an Administrator as well, this way things will work as intended.`n`n(This notification will only show up once)"
   }
   Traytip, Live Enhancement Suite, Double right click anywhere in Live to bring up custom menus!, 5
   SetTimer, tooltipboi, Delete
Return

exitfunc:
   gosub coolfunc
   FileDelete,%A_ScriptDir%\resources\activecheat.txt
   exitapp
Return              
