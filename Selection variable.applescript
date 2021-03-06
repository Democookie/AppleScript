use sys : application "System Events"
use scripting additions

property initialRun : true


set _P to a reference to process "Spotlight"
set _M to a reference to menu bar item "Spotlight" of menu bar 1 of _P
set _W to a reference to window "Spotlight" of _P
set _T to a reference to text field 1 of _W


get [¬
	"After dismissing this alert, Spotlight will appear. ", ¬
	"Please select some text within its search bar. ", ¬
	"You have about 5 seconds to do this from the time ", ¬
	"Spotlight appears.", linefeed, linefeed, ¬
	"Press OK when ready."]
if initialRun then display alert (the result as text)
set initialRun to false

-- Raise Spotlight
-- click _M --> does not work
-- Change the following line as needed to match the key combo used to trigger Spotlight:
tell sys to keystroke space using {option down, command down}

repeat 15 times -- 3 seconds maximum
	if _T exists then ¬
		exit repeat
	delay 0.2
end repeat

if _W exists then if _T exists then tell _T
	set its value to "Select some of this text in Spotlight."
	
	delay 5
	
	set t to "You selected the following text:"
	set selectedText to the value of its attribute "AXSelectedText"
	
	if the selectedText is in {"", missing value} then ¬
		set t to "No text was selected."
	
	return display notification the selectedText with title t
end tell


"Spotlight did not appear.  Sorry."