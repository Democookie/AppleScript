property ptyScriptName : "Activate Google Chrome Tab for Specified URL"
property ptyScriptVer : "1.2" --  ADD Activate Google command
property ptyScriptDate : "2018-10-13"
property ptyScriptAuthor : "estockly" -- adapted for KM by JMichaelTX

(*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
PURPOSE:
  • Activate Google Chrome Tab for Specified URL
      • If URL is for existing Tab, that Window/Tab will be made frontmost
      • Else a new Tab in frontmoat Window will be added for URL
  
RETURNS:  Chrome Window/TAB with Requested URL at Front

REQUIRED:
  1.  macOS 10.11.6+
  2.  Mac Applications
      • Google Chrome
      
TAGS:  @CAT.Web @CAT.Windows @SW.Chrome @type.Example @Lang.AS @Auth.Other @CAT.URL

REF:  The following were used in some way in the writing of this script.

  1.  2017-05-14, estockly, Late Night Software Ltd.
      What is Best Method to Activate Google Chrome Tab for Existing URL? (Ques by @JMichaelTX)
      http://forum.latenightsw.com/t/what-is-best-method-to-activate-google-chrome-tab-for-existing-url/600/16?u=jmichaeltx
      
~~~ MY QUESTION on the SD FORUM ~~~
What is Best Method to Activate Google Chrome Tab for Existing URL?

RESULTS:

Congratulations Ed! Your script is the fastest by 2X when run against my standard test from above 
(10 win with 20 total tabs):
    @JMichaelTX:  0.39     @ccstone: 0.38       @estocky: 0.17

~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*)

set urlToFind to "https://www.baidu.com"

tell application "Google Chrome"
	set windowTabList to URL of tabs of every window
	set targetURL to urlToFind
	set found to false
	set windowIndex to 1
	
	repeat with thisWindowsTabs in windowTabList
		set TabIndex to 1
		repeat with TabURL in thisWindowsTabs
			
			if TabURL as text = targetURL then
				set index of window windowIndex to 1
				set active tab index of window 1 to TabIndex
				set found to true
				exit repeat
			end if
			set TabIndex to TabIndex + 1
		end repeat
		if found then exit repeat
		set windowIndex to windowIndex + 1
	end repeat
	if not found then
		make new tab at after thisWindowsTabs with properties {URL:targetURL}
	end if
	
	activate
	
end tell

--- Force macOS to Actually Make the Window FrontMost ---

tell application "System Events"
	tell application process "Google Chrome"
		tell (front window) to perform action "AXRaise"
	end tell
end tell

return "OK"