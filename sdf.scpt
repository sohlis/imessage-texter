

set filePath to "Users:stefansohlstrom:Projects:imessageSender:contacts.txt"
splitFileAndSendMessage(filePath)

-- *** Utils ***
-- Logging
-- `log (class of lineArray)` ? returns the class of the variable


on splitFileAndSendMessage(theFile)
-- first, read the file
    set theFile to readFile(theFile)
-- next, split the file into lines
    set theFile to paragraphs of theFile
-- next, for every paragraph, get the phone number and name
    set paragraphsArray to paragraphs of theFile
    -- now, a for loop that loops through paragraphsArray and logs the phone number and name
    repeat with theLine in theFile
        set lineArray to my theSplit(theLine, ",")
        set thePhone to first item of lineArray
        set theName to second item of lineArray
        sendMessage("Hello " & first word of theName, thePhone)
    end repeat
end splitFileAndSendMessage

on theSplit(theString, theDelimiter)
		-- save delimiters to restore old settings
		set oldDelimiters to AppleScript's text item delimiters
		-- set delimiters to delimiter to be used
		set AppleScript's text item delimiters to theDelimiter
		-- create the array
		set theArray to every text item of theString
		-- restore the old setting
		set AppleScript's text item delimiters to oldDelimiters
		-- return the result
		return theArray
	end theSplit

on readFile(theFile)
    -- Convert the file to a string
    set theFile to theFile as string
    -- Read the file and return its contents
    return read file theFile
end readFile


on sendMessage(theMessage, thePhoneNumber)
    -- Send a message to a specific phone number
    tell application "Messages"
        set targetService to 1st service whose service type = iMessage
        set targetBuddy to buddy thePhoneNumber of targetService
        send theMessage to targetBuddy
    end tell
    log "Message sent to " & thePhoneNumber
end sendMessage
