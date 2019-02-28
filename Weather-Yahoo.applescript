use AppleScript version "2.4" -- Yosemite (10.10) or later
   # You can also use a dialog
display dialog (currentWeather & " (" & currentTemperature & "°C)") ¬
       with title ("Weather of the day") ¬
       with icon note ¬
       buttons {"OK"} default button 1
*)
Nom            : retrieveHTMLContents 
Description    : Retrieve source code of web page
pageURL        : URL of the web page
return        : the source code of the web page
*)
Nom                    : retrieveText 
Description            : Retrieve a text from a text document located between two boundaries
textDocument            : document to search
minBoundaryString    : the searched text is located after the minimum boundary
maxBoundaryString    : the searched text is located before the maximum boundary
return                : the text found
*)
set fichierMeteo to open for access POSIX file "/Users/bruno/Desktop/meteo2.txt" with write permission
   write websitesource to the fichierMeteo
   close access the fichierMeteo
*)