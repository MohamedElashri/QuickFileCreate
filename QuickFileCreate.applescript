property defaultEditor : "TextEdit"
property editorList : {"TextEdit", "BBEdit", "Visual Studio Code", "Nova", "Sublime Text", "VimR", "Other..."}
property openAfterCreation : true

on run
	-- Load saved preferences if they exist
	try
		set savedEditor to (do shell script "defaults read com.melashri.QuickFileCreate EditorPreference")
		set numericOpenAfterCreation to (do shell script "defaults read com.melashri.QuickFileCreate OpenAfterCreation")
		if numericOpenAfterCreation is "1" then
			set openAfterCreation to true
		else
			set openAfterCreation to false
		end if
	on error
		set savedEditor to defaultEditor
		set openAfterCreation to true -- Default to true if there is an error reading the setting
	end try
	
	-- Set the toggle menu item text based on current status
	if not openAfterCreation then
		set toggleText to "Turn Auto-Open ON [OFF]"
	else
		set toggleText to "Turn Auto-Open OFF [ON]"
	end if
	
	set choices to {"Create File", "Set Default Editor", toggleText, "Quit"}
	set userChoice to choose from list choices with prompt "What would you like to do?" default items {"Create File"}
	
	if userChoice is false then
		return
	else if item 1 of userChoice is "Create File" then
		createFile(savedEditor)
	else if item 1 of userChoice is "Set Default Editor" then
		setDefaultEditor()
	else if item 1 of userChoice is toggleText then
		toggleAutoOpen()
	end if
end run

on createFile(currentEditor)
	tell application "Finder"
		set currentFolder to (folder of the front window) as alias
	end tell
	
	display dialog "Enter the file name with extension (e.g., myfile.txt, script.py):" default answer ""
	set fullFileName to text returned of result
	
	if fullFileName does not contain "." then
		display dialog "No file extension detected. Please include an extension (e.g., .txt, .py)" buttons {"OK"} default button "OK"
		return
	end if
	
	tell application "Finder"
		make new file at currentFolder with properties {name:fullFileName}
		set newFile to result as alias
	end tell
	
	if openAfterCreation then
		try
			set appPath to getAppPath(currentEditor)
			do shell script "open -a " & quoted form of appPath & " " & quoted form of (POSIX path of newFile)
		end try
	end if
end createFile

on setDefaultEditor()
	set chosenEditor to choose from list editorList with prompt "Choose your preferred editor:" default items {defaultEditor}
	if chosenEditor is false then return
	
	set newEditor to item 1 of chosenEditor
	
	if newEditor is "Other..." then
		set newEditor to (choose file with prompt "Please select your preferred editor application:" of type "app")
		set newEditor to POSIX path of newEditor
	end if
	
	do shell script "defaults write com.melashri.QuickFileCreate EditorPreference " & quoted form of newEditor
end setDefaultEditor

on toggleAutoOpen()
	set openAfterCreation to not openAfterCreation
	if openAfterCreation then
		do shell script "defaults write com.melashri.QuickFileCreate OpenAfterCreation -bool true"
	else
		do shell script "defaults write com.melashri.QuickFileCreate OpenAfterCreation -bool false"
	end if
end toggleAutoOpen

on getAppPath(appName)
	set appPath to appName
	if appName is "TextEdit" then
		set appPath to "/System/Applications/TextEdit.app"
	else if appName is "BBEdit" then
		set appPath to "/Applications/BBEdit.app"
	else if appName is "Visual Studio Code" then
		set appPath to "/Applications/Visual Studio Code.app"
	else if appName is "Nova" then
		set appPath to "/Applications/Nova.app"
	else if appName is "Sublime Text" then
		set appPath to "/Applications/Sublime Text.app"
	else if appName is "VimR" then
		set appPath to "/Applications/VimR.app"
	end if
	return appPath
end getAppPath
