<#
===================================================================================
Paessler PRTG Sensor to check if OU's are Protected from accidental deletion
===================================================================================
Autor:        Stefan Redlin
Script:       CheckOUAccidentalDeletion.ps1
Version:      1.0
Date:         22.03.2019
Environment:  Windows Server 2012R2
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
#>

if((Test-Path -Path C:\Logs\Maintenance\)-eq $False){
New-Item -Path C:\Logs\Maintenance\ -ItemType Directory
}
else{}

 
$query = Get-ADOrganizationalUnit -Filter * -Properties * | where {$_.ProtectedFromAccidentalDeletion -eq $false}
$query| Select-Object CanonicalName| Export-CSV “C:\Logs\Maintenance\unprotectedOU.csv” -Encoding UTF8
$query = ($Query).Count

Write-Host "<prtg>"
Write-Host "<result>" 
Write-Host "<channel>Total unprotected Organisation Units</channel>" 
    
Write-Host "<value>" $query "</value>" 
Write-Host "</result>"
if ($query -eq 0){
Write-Host "<text>All Organisation Units are protected.</text>"
}
else{
Write-Host "<text>" $query "unprotected Organisation Units found. Please check Logs at Server $ENV:COMPUTERNAME C:\Logs\Maintenance\unprotectedOU.csv</text>"
}
Write-Host "</prtg>"