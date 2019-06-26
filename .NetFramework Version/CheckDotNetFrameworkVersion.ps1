<#
===================================================================================
Paessler PRTG Sensor to check .NetFramework Version
===================================================================================
Autor:        Stefan Redlin
Script:       CheckDotNetFrameworkVersion.ps1
Version:      1.0
Date:         01.05.2019
Tested Environment:  Windows Server 2012R2/2016
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
Used this as a hint https://stackoverflow.com/questions/3487265/powershell-script-to-return-versions-of-net-framework-on-a-machine
#>

#region: Server to query
param(
$Server
)#endregion


#region: Query for .NetFramework Release Number
$DotNetVersion = Invoke-Command -ComputerName $Server -ScriptBlock {$QueryDotNetVersion =Get-ChildItem 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP' -Recurse  |
  Get-ItemProperty -name Version, Release -EA 0 |
# Where-Object { $_.PSChildName -match '^(?!S)\p{L}'} |
Where-Object { $_.PSChildName -eq "Full"};$QueryDotNetVersion}4>&1
#endregion
#region: Version List
$DotNetRelease45=378389
$DotNetRelease451=378675
$DotNetRelease451extra=378758
$DotNetRelease452=379893
$DotNetRelease46=393295
$DotNetRelease46extra = 393297
$DotNetRelease461=394254
$DotNetRelease461extra=394271
$DotNetRelease462=394802
$DotNetRelease462extra=394806
$DotNetRelease47=460798
$DotNetRelease47extra=460805
$DotNetRelease471=461308
$DotNetRelease471extra=461310
$DotNetRelease472=461808
$DotNetRelease472extra=461814
$DotNetRelease48=528049
#endregion
$Version = $DotNetVersion.release.ToString()
 
#region: Switch Statement to write NetFramework Version to $text Variable 
$text= switch ($Version){

$DotNetRelease45 {'4.5';}
$DotNetRelease451 {'4.5.1'}
$DotNetRelease451extra {'4.5.1'}
$DotNetRelease452 {'4.5.2'}
$DotNetRelease46 {'4.6'}
$DotNetRelease46extra {'4.6'}
$DotNetRelease461 {'4.6.1'}
$DotNetRelease461extra {'4.6.1'}
$DotNetRelease462 {'4.6.2'}
$DotNetRelease462extra {'4.6.2'}
$DotNetRelease47 {'4.7'}
$DotNetRelease47extra {'4.7'}
$DotNetRelease471 {'4.7.1'}
$DotNetRelease471extra {'4.7.1'}
$DotNetRelease472 {'4.7.2'}
$DotNetRelease472extra {'4.7.2'}
$DotNetRelease48 {'4.8'}
default {"Update Sensor with new .NetVersion Version. Check https://docs.microsoft.com/de-de/dotnet/framework/migration-guide/how-to-determine-which-versions-are-installed"}
}
#endregion


#region: PRTG Output
Write-Host "<prtg>" 
if($Version -eq $DotNetRelease45){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>.NetFramework 4.5</channel>"
               "<value>$Count</value>"
               "</result>"
               "<text>$Text</text>"
               if($Version -eq $DotNetRelease451 -or -$Version -eq $DotNetRelease451extra){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>.NetFramework 4.5.1</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $DotNetRelease46 -or -$Version -eq $DotNetRelease46extra){[string]$Count='1'}else{[string]$count='0'}
               Write-Host "<result>"
               "<channel>.NetFramework 4.6</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $DotNetRelease461 -or -$Version -eq $DotNetRelease461extra){[string]$Count='1'}else{[string]$count='0'}
               Write-Host "<result>"
               "<channel>.NetFramework 4.6.1</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $DotNetRelease462 -or -$Version -eq $DotNetRelease462extra){[string]$Count='1'}else{[string]$count='0'}
               Write-Host "<result>"
               "<channel>.NetFramework 4.6.2</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $DotNetRelease47 -or $Version -eq $DotNetRelease47extra){$Count=1}else{$count="0"}
               Write-Host "<result>"
               "<channel>.NetFramework 4.7</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $DotNetRelease471 -or -$Version -eq $DotNetRelease471extra){[string]$Count='1'}else{[string]$count='0'}
               Write-Host "<result>"
               "<channel>.NetFramework 4.7.1</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $DotNetRelease472 -or -$Version -eq $DotNetRelease472extra){[string]$Count='1'}else{[string]$count='0'}
               Write-Host "<result>"
               "<channel>.NetFramework 4.7.2</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $DotNetRelease48){[string]$Count='1'}else{[string]$count='0'}
               Write-Host "<result>"
               "<channel>.NetFramework 4.8</channel>"
               "<value>$Count</value>"
               "</result>"
Write-Host "</prtg>"
#endregion