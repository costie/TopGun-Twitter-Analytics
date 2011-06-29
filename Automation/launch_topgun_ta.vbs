option explicit

'NB: You may need to change the csPentahoPath to point to your actual Pentaho directory (i.e. the directory where kitchen.bat is located)
const csPentahoPath="C:\pentaho_401\data-integration\"

'NB: You may need to change the logon and password
const csCmdLine = "kitchen.bat /rep:pentaho_repository /user:admin /pass:admin /job:RunMe /dir:/twitter_analytics /level:Basic > twitter_dw.log"

const csPostRunPause = 60000

dim objShell

sub InitShell()
	set objShell = CreateObject("WScript.Shell")

	'Pan needs to run in its own directory
	objShell.CurrentDirectory = csPentahoPath
end sub

sub CloseShell()
	set objShell = nothing
end sub

sub RunTwitterDWJob()
	dim iRunRetVal

	iRunRetVal = objShell.Run(csCmdLine, 0, true)
	
	'This pause is to allow Java to clean-up its resources.  More of a precaution than anything else
	WScript.Sleep(csPostRunPause)
end sub

''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''MAIN CODE'''''''''''''''''''''''''''''''''''''''
''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''''
'Code starts running from HERE
InitShell

Do
	RunTwitterDWJob
Loop While True

CloseShell
