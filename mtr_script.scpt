try
	tell application "Finder"
		if exists disk "smb_net_drive<insertnetwrokdrive>" then
			runBackupScript() of me
		else
			if exists (mount volume "smb://192.168.0.100/<pathtonetdrive>") then
				runBackupScript() of me
			else
				error "The smb disk could not be mounted"
			end if
		end if
	end tell
on error
	display dialog "The script encountered a problem."
end try
to runBackupScript()
	tell application "Finder"
		do shell script "/usr/local/sbin/scripts/callrsync.sh"
	end tell
end runBackupScript
