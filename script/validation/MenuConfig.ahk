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

createpluginmenu:
   
   ; this thing over here clears out all variables and folders from memory before rebuilding to prevent double entries while using dynamic reload.
   if (menuitemcount != ""){
      menu, ALmenu, DeleteAll
      
      Array := ""
      menuitemcount := ""
      querycount := ""
      categoryname := ""
      configoutput := ""
      TestForContent := ""
      slashcount := ""
      counter := ""
      outputcount := ""
      historyi := ""
      table := trimArray(table)
      loop {
         if (historyi = ""){
            historyi := 1
         }
         if (table[historyi] = ""){
            Break
         }
         menu, % table[historyi], DeleteAll
         historyi := historyi + 1
      }
      table := ""
      historyi := ""
   }
   
   loop, 1 {
      ; loop, 1 does nothing. I just used it so I could collapse this section of code inside of notepad++.
      table := []
      mathvar := ""
      Array := Array()
      categorydest := Array()
      categoryname := Array()
      categorydest[1] := "ALmenu"
      depth := 1
      Loop
      {
         if (mathvar = "") ;if the counter is non existent, make it 1. The counter keeps tracks of the line count. Didn't know you could use 'loop, read' for this until after I was done with it.
         {
            Mathvar := 1
         }
         FileReadLine, configoutput, menuconfig.ini, mathvar
         if (configoutput = ""){
            ;checks if string is empty
            goto, skipalles
         }
         TestForcontent := SubStr(configoutput, 1, 1)
         TestForContent := RegExReplace(TestForContent, ";", "ȶ") ; the way I used to check for stuff here is really dumb. Never fixed it because it works. I used these characters because I figured nobody would ever use them.
         If (TestForContent = "ȶ"){
            ;checks if line is comment
            goto, skipalles
         }
         TestForcontent := SubStr(configoutput, 1)
         TestForContent := RegExReplace(TestForContent, "Readme", "þ")
         If (TestForContent = "þ"){
            ;checks if line is Readme
            Menu, ALmenu, Add, Readme, readme
            goto, skipalles
         }
         TestForContent := SubStr(configoutput, 1)
         TestForContent := RegExReplace(TestForContent, "/nocategory", "ȴ")
         If (TestForContent = "ȴ"){
            ;checks if line is /nocategory
            CategoryHeader := 0
            NoCategoryHeader := 1
            goto, skipalles
         }
         TestForContent := SubStr(configoutput, 1)
         TestForContent := RegExReplace(TestForContent, "--", "ȴ")
         If (TestForContent = "ȴ"){
            ;checks if line is --
            If (NoCategoryHeader = 1){
               ;is the item in or out of a category?
               Menu, ALmenu, Add
               CategoryHeader := 0
               goto, skipalles
            }
            If (CategoryHeader = 1){
               Menu, % categoryname[depth], Add
            } else  {
               Menu, ALmenu, Add
            }
            goto, skipalles
         }
         TestForContent := RegExReplace(TestForContent, "—", "ȴ")
         If (TestForContent = "ȴ"){
            ;checks if line is --
            If (NoCategoryHeader = 1){
               ;is the item in or out of a category?
               Menu, ALmenu, Add
               CategoryHeader := 0
               goto, skipalles
            }
            If (CategoryHeader = 1){
               Menu, % categoryname[depth], Add
            } else  {
               Menu, ALmenu, Add
            }
            goto, skipalles
         }
         slashcount := RegExMatch(TestForcontent, "/[^/;]+")
         if (slashcount > 0){
            ; tests if line is category
            depth := slashcount
            categoryname[depth] := SubStr(configoutput, (slashcount + 1))
            if (depth > 1){
               categorydest[depth] := categoryname[(depth - 1)]
            }
            ;Msgbox % categoryname[depth] . " and depth = " . depth
            if (historyi = ""){
               historyi := 1
            }
            historyi := (historyi + 1) ; history keeps track of all the subcategory names so they can properly be cleared later.
            table[historyi] := categoryname[depth]
            
            CategoryHeader := 1
            NoCategoryHeader := 0
            goto, skipalles
         }
         TestForContent := SubStr(configoutput, 1)
         TestForContent := RegExReplace(TestForContent, "\.\.", "ȴ")
         If (TestForContent = "ȴ"){
            ;checks if line is ..
            depth := depth - 1
            if (depth = 0){
               depth := 1
               CategoryHeader := 0
               NoCategoryHeader := 1
            }
            goto, skipalles
         }
         If (configoutput = "End" or configoutput = "END" or configoutput = "end"){
            ;checks for the end of the config file
            Break
         }
         
         ;// Below this line is the stuff that happens when the config is is actually outputting entries and it's not just configuration or empty lines
         {
            if (outputcount = "") ;counting how many times the config has output menu entries
            outputcount := 1
         }
         outputcount := outputcount + 1
         counter := outputcount/2
         if (counter ~= "\.0+?$|^[^\.]$"){
            ; on titles only
            configoutput := StrReplace(configoutput, "&", "&&")
         }
         
         Array[mathvar] := configoutput ;putting the output in an array
         
         If (counter ~= "\.0+?$|^[^\.]$"){
            ; on titles only
            actionname:= RegExReplace(configoutput, "^.*?,")
            
            if (menuitemcount = "") ;counting how many items the config has output
            {
               menuitemcount := 0
            }
            menuitemcount := menuitemcount + 1
            
            If (NoCategoryHeader = 1){
               Menu, ALmenu, Add, % Array[mathvar], % menuitemcount
               CategoryHeader := 0
            }
            If (CategoryHeader = 1){
               Menu, % categoryname[depth], Add, % Array[mathvar], % menuitemcount
               Menu, % categorydest[depth], Add, % categoryname[depth], % ":" . categoryname[depth]
            } else  {
               Menu, ALmenu, Add, % Array[mathvar], % menuitemcount
            }
		} else  {
            if (querycount = "") ;counting in order to figure out if config output is a menu item name or a search query
            {
               querycount := 0
            }
            querycount := querycount + 1
            queryname%querycount% := Array[mathvar]
         }
         
         skipalles:
         mathvar := mathvar + 1
      }
      goto klaar
      
      ; Alright, hear me out.
      ; This right here, is my biggest programming sin.
      ; I was actually hoping nobody would ever have to see this.
      ; I'm so sorry
      
      ; This "library" below here contains 2000 numerical variables labeled 1 through 2000.
      ; When you click a menu item in AHK, it will ALWAYS perform a "gosub", which is basically the same as a goto except it can go back to whatever it was doing beforehand once it's done.
      ; A goto can only go to a label, and AHK does not support dynamic labels.
      ; I have no idea what people will name their menu entries so I thought of the infamous minecraft item ID system and picked it as a "solution".
      ; I printed out a 4000 line AHK script that's nothing but goto markers with two lines of repeated code each.
      ; None of this code is actually executed unless a menu item is clicked; so I moved it to a library to debloat my code.
      ; I would be greatful if you could figure out a better way to do this, but right now; I'm going to keep sinning. Sinning hard forever.
      #include validation\MenuIndex.ahk
   }
   klaar:
Return
