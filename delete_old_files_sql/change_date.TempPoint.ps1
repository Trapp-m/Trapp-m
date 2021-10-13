<#	
	.NOTES
	===========================================================================
	 Created with: 	SAPIEN Technologies, Inc., PowerShell Studio 2021 v5.8.194
	 Created on:   	13/10/2021 15:45
	 Created by:   	pdohogne
	 Organization: 	
	 Filename:     	
	===========================================================================
	.DESCRIPTION
		A description of the file.
#>



foreach ($file in Get-ChildItem "D:\Temp\mosart_03.04") { $(Get-Item $file.Fullname).lastwritetime = $(Get-Date).AddHours(-5) }
