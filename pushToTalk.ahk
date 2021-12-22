#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#WinActivateForce
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
;============================================================================
; Program Keys to remember for editing
; + = Shift
; ! = Alt
; ^ = Ctrl
; # = "Windows" key
;============================================================================
; Depends on OSD function I import elsewhere. The OSD function is here: https://www.autohotkey.com/board/topic/8190-osd-function/
talking := 0
pushToTalk := 0


^!Space::
  if (pushToTalk = 1)
  {

	  if (talking = 0 )
	  {
		talking := 1
		;To mute the mic, the last param is the ID of my mic. To find out which mic to mute look here: https://www.autohotkey.com/docs/commands/SoundSet.htm#Soundcard
		SoundSet, 0, Microphone, mute,1 
		OSD("🔊")
	  }
	}


Return

^!Space Up::
  if (pushToTalk = 1)
  {
	  if (talking = 1 )
	  {
			talking := 0
			SoundSet, 1, Microphone, mute,1 
			OSD("🔇")
	  }
  }
Return

Pause::
	if (pushToTalk = 0)
	{
		;We will enable pushToTalk
		talking := 0
		pushToTalk := 1
		SoundSet, 1, Microphone, mute,1 				
		OSD("Push to talk enabled")
	}
	else
	{
		pushToTalk := 0
		talking := 1
		SoundSet, 0, Microphone, mute,1 
		OSD("Push to talk disabled")

	}

Return

