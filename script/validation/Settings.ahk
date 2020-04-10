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

; This next loop is the settings.ini "spell checker". As a lot of variables come from this text file.
; It's important that all of them are present in the correct way; otherwise AHK might misbehave or do stupid stuff.
; I didn't really know how to make this work as a function back then so I just copy pasted the different checks for each of the values.
; Contrary to what it looks like, these are not all the same; not every field requires a 1 or a 0
Loop, Read, %A_ScriptDir%\settings.ini
{
   line := StrReplace(A_LoopReadLine, "`r", "")
   line := StrReplace(line, "`n", "")
   
   if (RegExMatch(line, "autoadd\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "autoadd" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      autoadd := result[2]
   }
   
   if (RegExMatch(line, "resetbrowsertobookmark\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "resetbrowsertobookmark" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      resetbrowsertobookmark := result[2]
   }
   
   if (RegExMatch(line, "bookmarkx\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(RegExReplace(result[2], "[0-9]") = ""){
         msgbox % "Invalid parameter for " . Chr(34) "bookmarkx" . Chr(34) . ": the specified parameter is not a number. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      bookmarkx := result[2]
   }
   
   if (RegExMatch(line, "bookmarky\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(RegExReplace(result[2], "[0-9]") = ""){
         msgbox % "Invalid parameter for " . Chr(34) "bookmarky" . Chr(34) . ": the specified parameter is not a number. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      bookmarky := result[2]
   }
   
   if (RegExMatch(line, "windowedcompensationpx\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(RegExReplace(result[2], "[0-9]") = ""){
         msgbox % "Invalid parameter for " . Chr(34) "windowedcompensationpx" . Chr(34) . ": the specified parameter is not a number. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      windowedcompensationpx := result[2]
   }
   
   if (RegExMatch(line, "disableloop\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "disableloop" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      disableloop := result[2]
   }
   
   if (RegExMatch(line, "saveasnewver\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "saveasnewver" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      saveasnewver := result[2]
   }
   
   if (RegExMatch(line, "usectrlaltsinstead\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "usectrlaltsinstead" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      usectrlaltsinstead := result[2]
   }
   
   if (RegExMatch(line, "altgrmarker\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "altgrmarker" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      altgrmarker := result[2]
   }
   
   if (RegExMatch(line, "middleclicktopan\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "middleclicktopan" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      middleclicktopan := result[2]
   }
   
   if (RegExMatch(line, "scrollspeed\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(RegExReplace(result[2], "[0-9]") = ""){
         msgbox % "Invalid parameter for " . Chr(34) "scrollspeed" . Chr(34) . ". The specified parameter is not a number. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      scrollspeed := floor(result[2])
   }
   
   if (RegExMatch(line, "addctrlshiftz\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "addctrlshiftz" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      addctrlshiftz := result[2]
   }
   
   if (RegExMatch(line, "0todelete\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "0todelete" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      0todelete := result[2]
   }
   
   if (RegExMatch(line, "absolutereplace\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "absolutereplace" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      absolutereplace := result[2]
   }
   
   if (RegExMatch(line, "enableclosewindow\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "enableclosewindow" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      enableclosewindow := result[2]
   }
   
   if (RegExMatch(line, "vstshortcuts\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "vstshortcuts" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      vstshortcuts := result[2]
   }
   
   if (RegExMatch(line, "smarticon\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "smarticon" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      smarticon := result[2]
   }
   
   if (RegExMatch(line, "dynamicreload\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "dynamicreload" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      dynamicreload := result[2]
   }
   
   if (RegExMatch(line, "pianorollmacro\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if ((RegExMatch(line, "SC\d\d") = 0)){
         msgbox % "Invalid parameter for " . Chr(34) "pianorollmacro" . Chr(34) . ". This needs to be a keycode starting with SC. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      pianorollmacro := result[2]
   }
   
   if (RegExMatch(line, "pianosearch\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "pianosearch" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      pianosearch := result[2]
   }
   
   if (RegExMatch(line, "enabledebug\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "enabledebug" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      enabledebug := result[2]
   }
   
   if (RegExMatch(line, "addtostartup\s=\s") != 0){
      result := StrSplit(line, "=", A_Space)
      if !(result[2] = 0 or result[2] = 1){
         msgbox % "Invalid parameter for " . Chr(34) "addtostartup" . Chr(34) . ". Valid parameters are: 1 and 0. The program will shut down now."
         run, %A_ScriptDir%\settings.ini
         exitapp
      }
      addtostartup := result[2]
   }
}
