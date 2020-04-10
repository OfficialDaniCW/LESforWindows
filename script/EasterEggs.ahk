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

cheats:
   InputBox, enteredcheat, A mysterious aura surrounds you..., Enter cheat:,,375,140
   FileDelete, %A_ScriptDir%\resources\activecheat.txt
   StringLower, enteredcheat, enteredcheat
   if (enteredcheat = "gaster"){
      exitapp
   }
   if (enteredcheat = "jazz"){
      FileAppend,jazz,%A_ScriptDir%\resources\activecheat.txt
      msgbox % "pianoroll cheat activated"
   }
   if (enteredcheat = "blackmidi" or enteredcheat = "black midi"){
      FileAppend,blackmidi,%A_ScriptDir%\resources\activecheat.txt
      msgbox % "pianoroll cheat activated"
   }
   if (enteredcheat = "subscribe to dylan tallchief" or enteredcheat = "#dylongang" or enteredcheat = "dylan tallchief" or enteredcheat = "dylantallchief"){
      run, https://www.youtube.com/c/DylanTallchief?sub_confirmation=1
   }
   if (enteredcheat = "303" or enteredcheat = "sylenth"){
      FileInstall, resources\arp303.mp3, %A_ScriptDir%\resources\arp303.mp3
      SoundPlay, %A_ScriptDir%\resources\arp303.mp3, wait
      FileDelete, %A_ScriptDir%\resources\arp303.mp3
      msgbox, thank you for trying this demo
   }
   if (enteredcheat = "live enhancement sweet" or enteredcheat = "les" or enteredcheat = "sweet"){
      FileInstall, resources\LES_vox.wav, %A_ScriptDir%\resources\LES_vox.wav
      SoundPlay, %A_ScriptDir%\resources\LES_vox.wav, wait
      FileDelete, %A_ScriptDir%\resources\LES_vox.wav
   }
   if (enteredcheat = "fl studio" or enteredcheat = "image line"){
      FileInstall, resources\flstudio.mp3, %A_ScriptDir%\resources\flstudio.mp3
      SoundPlay, %A_ScriptDir%\resources\flstudio.mp3, wait
      FileDelete, %A_ScriptDir%\resources\flstudio.mp3
   }
   if (enteredcheat = "ghost" or enteredcheat = "ilwag" enteredcheat = "lvghst"){
      FileInstall, resources\lvghst.mp3, %A_ScriptDir%\resources\lvghst.mp3
      SoundPlay, %A_ScriptDir%\resources\lvghst.mp3, wait
      FileDelete, %A_ScriptDir%\resources\lvghst.mp3
   }
   if (enteredcheat = "twitter" or enteredcheat = "yo twitter"){
      FileInstall, resources\yotwitter.mp3, %A_ScriptDir%\resources\yotwitter.mp3
      SoundPlay, %A_ScriptDir%\resources\yotwitter.mp3, wait
      FileDelete, %A_ScriptDir%\resources\yotwitter.mp3
      run, https://twitter.com/aevitunes
      run, https://twitter.com/sylvianyeah
      run, https://twitter.com/DylanTallchief
      run, https://twitter.com/nyteout
      run, https://twitter.com/InvertedSilence
      run, https://twitter.com/FalseProdigyUS
   }
   if (enteredcheat = "bad time" or enteredcheat = "sans" or enteredcheat = "undertale"){
      SoundBeep, 589, 94
      sleep 31
      SoundBeep, 589, 94
      sleep 31
      SoundBeep, 1180, 94
      sleep 156
      SoundBeep, 885, 94
      sleep 281
      SoundBeep, 841, 94
      sleep 156
      SoundBeep, 787, 94
      sleep 156
      SoundBeep, 689, 118
      Sleep 100
      SoundBeep, 598, 94
      sleep 31
      SoundBeep, 698, 94
      sleep 31
      SoundBeep, 787, 94
      Sleep 400
   }
   if (enteredcheat = "beta" or enteredcheat = "testers" or enteredcheat = "credits" ){
      Msgbox,,thank you :), % "My eternal gratitude goes to the following people for helping me improve LES over the course of its development:`n`nFalse Prodigy`nDirect`nAevin`nReach`nAzles`nFrection`nMr. Bill`nSamuel Robinson`nViticz`nNyteout"
   }
   if (enteredcheat = "owo" or enteredcheat = "uwu" or enteredcheat = "what's this" or enteredcheat = "what" ){
      Msgbox,,owowowowoowoowowowoo, % "what's this????????? ^^ nya?"
   }
   if (enteredcheat = "als" or enteredcheat = "adg" or enteredcheat = "collab bro" ){
      MsgBox, 4,Live Enhancement suite, Doing this will exit your current project without saving. Are you sure?
      IfMsgBox Yes
      {
         gosub coolfunc
         SetTitleMatchMode, 2
         WinClose, Ableton Live
         sendinput, {Shift down}{n}{shift up}
         sleep, 20
         FileCreateDir, resources\als Lessons
         FileInstall, resources\als Lessons\LessonsEN.txt, %A_ScriptDir%\resources\als Lessons\LessonsEN.txt
         FileInstall, resources\als.als, %A_ScriptDir%\resources\als.als
         WinWaitClose , Ableton Live
         Run, %A_ScriptDir%\resources\als.als
         sleep 10000
         Reload
         exitapp
      } else  {
         gosub coolfunc
         Reload
      }
    }
   if (enteredcheat = "kilohearts"){
      FileAppend,kilohearts,%A_ScriptDir%\resources\activecheat.txt
      msgbox % "phaseplant shortcuts activated"
      Hotkey, ~!a, phaseplanta
      Hotkey, ~!n, phaseplantn
      Hotkey, ~!s, phaseplants
      Hotkey, ~!w, phaseplantw
      Hotkey, ~!d, phaseplantd
      Hotkey, ~!f, phaseplantf
      Hotkey, ~!o, phaseplanto
      Hotkey, ~!l, phaseplantl
   }
return              