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
#endregion




#region: Generate text for sensor
[String]$Version = (((Get-ADComputer -SearchBase $Searchbase -Filter {OperatingSystem -Like "Windows 10*" -and (Enabled -eq $true)} -Property *))).OperatingSystemVersion |Sort-Object -Descending |Select-Object -First 1
[String]$Version = $Version.substring(6).TrimEnd(")")

[array]$Branch2004Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch2004)} -Property *))
$Count =$Branch2004Count.Count 

If($Version -gt $Branch2004.substring(1).TrimEnd("*")){$Text = "Update Sensor with new W10 Version. Check https://docs.microsoft.com/de-de/windows/release-information/";$NewBranch = $Count}else{$text = "All W10 Branches are known.";$NewBranch = 0}
#endregion


#region: XML Output for PRTG
Write-Host "<prtg>" 
[array]$W10ClientCount = ((Get-ADComputer -SearchBase $Searchbase -Filter {OperatingSystem -Like "Windows 10*"} -and (Enabled -eq $true) -Property *)) 
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
[array]$Branch1507Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch1507)} -Property *))
$Count =$Branch1507Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1507 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
[array]$Branch1511Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch1511)} -Property *))
$Count =$Branch1511Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1511 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
[array]$Branch1607Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -like $Branch1607)}-Property *))
$Count =$Branch1607Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1607 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
[array]$Branch1703Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch1703)} -Property *))
$Count =$Branch1703Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1703 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
[array]$Branch1709Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch1709)} -Property *)) 
$Count =$Branch1709Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1709 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
[array]$Branch1803Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch1803)} -Property *))
$Count =$Branch1803Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1803 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
[array]$Branch1809Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch1809)} -Property *))
$Count =$Branch1809Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1809 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
[array]$Branch1903Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch1903)} -Property *))
$Count =$Branch1903Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1903 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
[array]$Branch1909Count = ((Get-ADComputer -SearchBase $Searchbase -Filter {(OperatingSystem -Like "Windows 10*") -and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch1909)} -Property *))
$Count =$Branch1909Count.Count 
               Write-Host "<result>"
               "<channel>Branch 1909 Clients</channel>"
               "<value>$Count</value>"
               "</result>"
[array]$Branch2004Count = (((Get-ADComputer -SearchBase $Searchbase  -Filter {(OperatingSystem -Like "Windows 10*")-and (Enabled -eq $true) -and (OperatingSystemVersion -Like $Branch2004)} -Property *)))
$Count =$Branch2004Count.Count 
               Write-Host "<result>"
               "<channel>Branch 2004 Clients</channel>"
               "<value>$Count</value>"
               "</result>"


####################################
#Insert new Version above this line#
####################################


Write-Host "</prtg>" 
#endregion
