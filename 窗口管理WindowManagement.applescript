use AppleScript version "2.4" -- Yosemite (10.10) or lateruse scripting additionstell application "System Events"	set myApplication to name of first application process whose frontmost is trueend tellset screenWidth to 1440 --2560/1440set screenHeight to 900 --1440/900tell application myApplication	set myWindowsCount to count of windows	if myWindowsCount = 0 then		display dialog "You don't have any windows open!" buttons "OK" default button 1	else if myWindowsCount ≤ 2 then		set myWidth to screenWidth / 2		set bounds of window 1 to {0, 0, myWidth, screenHeight}		try			set bounds of window 2 to {myWidth, 0, myWidth * 2, screenHeight}		end try	else if myWindowsCount ≥ 3 and myWindowsCount ≤ 4 then		set myWidth to screenWidth / 2		set myHeight to (screenHeight - 22) / 2		set bounds of window 1 to {0, 0, myWidth, myHeight}		set bounds of window 2 to {myWidth, 0, myWidth * 2, myHeight}		set bounds of window 3 to {0, myHeight + 22, myWidth, (myHeight * 2) + 22}		try			set bounds of window 4 to {myWidth, myHeight + 22, myWidth * 2, (myHeight * 2) + 22}		end try	else if myWindowsCount ≥ 5 and myWindowsCount ≤ 6 then		set myWidth to screenWidth / 3		set myHeight to (screenHeight - 22) / 2		set bounds of window 1 to {0, 0, myWidth, myHeight}		set bounds of window 2 to {myWidth, 0, myWidth * 2, myHeight}		set bounds of window 3 to {myWidth * 2, 0, myWidth * 3, myHeight}		set bounds of window 4 to {0, myHeight + 22, myWidth, (myHeight * 2) + 22}		set bounds of window 5 to {myWidth, myHeight + 22, myWidth * 2, (myHeight * 2) + 22}		try			set bounds of window 6 to {myWidth * 2, myHeight + 22, myWidth * 3, (myHeight * 2) + 22}		end try	else if myWindowsCount ≥ 7 and myWindowsCount ≤ 8 then		set myWidth to screenWidth / 4		set myHeight to (screenHeight - 22) / 2		set bounds of window 1 to {0, 0, myWidth, myHeight}		set bounds of window 2 to {myWidth, 0, myWidth * 2, myHeight}		set bounds of window 3 to {myWidth * 2, 0, myWidth * 3, myHeight}		set bounds of window 4 to {myWidth * 3, 0, myWidth * 4, myHeight}		set bounds of window 5 to {0, myHeight + 22, myWidth, (myHeight * 2) + 22}		set bounds of window 6 to {myWidth, myHeight + 22, myWidth * 2, (myHeight * 2) + 22}		set bounds of window 7 to {myWidth * 2, myHeight + 22, myWidth * 3, (myHeight * 2) + 22}		try			set bounds of window 8 to {myWidth * 3, myHeight + 22, myWidth * 4, (myHeight * 2) + 22}		end try	end ifend tell