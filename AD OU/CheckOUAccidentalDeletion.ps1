<#
===================================================================================
Paessler PRTG Sensor to check if OU's are Protected from accidental deletion
===================================================================================
Autor:        Stefan Redlin
Script:       CheckOUAccidentalDeletion.ps1
Version:      1.1
Date:         22.04.2020
Environment:  Windows Server 2012R2/Windows Server 2016/Windows Server 2019
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
#>

 
$query = Get-ADOrganizationalUnit -Filter * -Properties * | where {$_.ProtectedFromAccidentalDeletion -eq $false}
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
Write-Host "<text>" $query "unprotected Organisation Units found. Please check Active Directory and identify the unprotected OU's.</text>"
}
Write-Host "</prtg>"
