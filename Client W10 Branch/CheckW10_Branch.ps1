<#
===================================================================================
Paessler PRTG Sensor to check W10 Branch
===================================================================================
Autor:        Stefan Redlin
Script:       CheckW10Branch.ps1
Version:      1.1
Date:         15.07.2019
Environment:  Windows Server 2016
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
$query}
#>

param(
$Searchbase
)


#region: W10 Version List from https://docs.microsoft.com/de-de/windows/release-information/    
$Branch1507 = "*10240*"  
$Branch1511 = "*10586*"
$Branch1607 = "*14393*"
$Branch1703 = "*15063*"
$Branch1709 = "*16299*"
$Branch1803 = "*17134*"
$Branch1809 = "*17763*" 
$Branch1903 = "*18362*"
$Branch1909 = "*18363*"
$Branch2004 = "*19041*"
$Branch20H2 = "*19042*"
#endregion



#region Queries
[array]$W10ClientCount = ((Get-ADComputer -SearchBase $Searchbase -Filter {OperatingSystem -Like "Windows 10*" -and (Enabled -eq $true)} -Property OperatingSystemVersion, OperatingSystemVersion)) 
# only query AD once and re-use results for better performance
[array]$Branch1507Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch1507 
[array]$Branch1511Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch1511
[array]$Branch1607Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch1607
[array]$Branch1703Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch1703
[array]$Branch1709Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch1709
[array]$Branch1803Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch1803
[array]$Branch1809Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch1809
[array]$Branch1903Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch1903
[array]$Branch1909Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch1909
[array]$Branch2004Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch2004
[array]$Branch20H2Count = $W10ClientCount|where OperatingSystemVersion -Like $Branch20H2
#endregion Queries


#region: Generate text for sensor
[String]$Version = (((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true)} -Property OperatingSystemVersion))).OperatingSystemVersion |Sort-Object -Descending |Select-Object -First 1
[String]$Version = $Version.substring(6).TrimEnd(")")

$Count = ($W10ClientCount|where OperatingSystemVersion -Like $Version).count

If($Version -gt $Branch20H2.substring(1).TrimEnd("*")){$Text = "Update Sensor with new W10 Version. Check https://docs.microsoft.com/de-de/windows/release-information/";$NewBranch = $Count}else{$text = "All W10 Branches are known.";$NewBranch = 0}
#endregion



#region: XML Output for PRTG
Write-Host "<prtg>" 
$Count =$W10ClientCount.Count 
Write-Host "<result>"
               "<channel>All W10 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
               "<text>$Text</text>"
               Write-Host "<result>"
               "<channel>New Branch</channel>"
               "<value>$NewBranch</value>"
               "</result>"
$Count =$Branch1507Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1507 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch1511Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1511 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch1607Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1607 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch1703Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1703 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch1709Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1709 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch1803Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1803 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch1809Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1809 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch1903Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1903 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch1909Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1909 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch2004Count.Count 
               Write-Host "<result>"
               "<channel>Branch 2004 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
$Count =$Branch20H2Count.Count 
               Write-Host "<result>"
               "<channel>Branch 20H2 Clients</channel>"
               "<value>$Count</value>"
               "</result>"


####################################
#Insert new Version above this line#
####################################


Write-Host "</prtg>" 
#endregion
