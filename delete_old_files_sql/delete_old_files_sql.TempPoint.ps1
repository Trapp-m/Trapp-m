<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.194
	 Created on:   	13/10/2021 15:37
	 Created by:   	pdohogne
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		Delete sql backup file older than x days
#>

#----- Define parameters -----#
#----- Get current date ----#
$Now = Get-Date
$Days = "15" #----- define amount of days ----#
$Targetfolder = "D:\Temp\mosart_03.04" #----- define folder where files are located ----#
$Extension = "*.xml" #----- define extension ----#
$Lastwrite = $Now.AddDays(-$Days)

#----- Get files based on lastwrite filter and specified folder ---#
$Files = Get-Children $Targetfolder -include $Extension -Recurse | where { $_.LastwriteTime -le "$Lastwrite" }

foreach ($File in $Files)
{
	if ($File -ne $Null)
	{
		write-host "Deleting File $File" backgroundcolor "DarkRed"
		Remove-item $File.Fullname | out-null
	}
	else{
		write-host "No more files to delete" -forgroundcolor "Green"
	}
	
}


