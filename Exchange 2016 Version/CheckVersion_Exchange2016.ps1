<#
===================================================================================
Paessler PRTG Sensor to check Exchange Server Version
===================================================================================
Autor:        Stefan Redlin
Script:       CheckVersion_Exchange2016.ps1
Version:      1.0
Date:         01.05.2019
Environment:  Windows Server 2016/Exchange2016
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
#>

#region
param(
$ExchangeServer
) =
#endregion

#region: Exchange Version List from https://docs.microsoft.com/de-de/exchange/new-features/build-numbers-and-release-dates?view=exchserver-2019#exchange-server-2016
$Preview = "15.1.225.16"
$RTM = "15.1.225.42"
$CU1 = "15.1.396.30"
$CU2 = "15.1.466.34"
$CU3 = "15.1.544.27"
$CU4 = "15.1.669.32"
$CU5 = "15.1.845.34"
$CU6 = "15.1.1034.26"
$CU7 = "15.1.1261.35"
$CU8 = "15.1.1415.2"
$CU9 = "15.1.1466.3"
$CU10 = "15.1.1531.3"
$CU11 = "15.1.1591.01"
$CU12 = "15.1.1713.5"
#endregion



#region Query Exchange Server for Version
$result = Invoke-Command -ComputerName $ExchangeServer -ScriptBlock {$query = Get-Command Exsetup.exe | select Version
$query}
$Version = $result.version.ToString()
#endregion

#region: Generate text for sensor
$Text= switch ($Version){

$Preview {"Exchange Server 2016 Preview"}
$RTM {"Exchange Server 2016 RTM"}
$CU1 {"Exchange Server 2016 Cumulative Update 1 (CU1)"}
$CU2 {"Exchange Server 2016 Cumulative Update 2 (CU2)"}
$CU3	{"Exchange Server 2016 Cumulative Update 3 (CU3)"}
$CU4 {"Exchange Server 2016 Cumulative Update 4 (CU4)"}
$CU5 {"Exchange Server 2016 Cumulative Update 5 (CU5)"}
$CU6 {"Exchange Server 2016 Cumulative Update 6 (CU6)"}
$CU7 {"Exchange Server 2016 Cumulative Update 7 (CU7)"}
$CU8 {"Exchange Server 2016 Cumulative Update 8 (CU8)"}
$CU9	 {"Exchange Server 2016 Cumulative Update 9 (CU9)"}
$CU10 {"Exchange Server 2016 Cumulative Update 10 (CU10)"}
$CU11 {"Exchange Server 2016 Cumulative Update 11 (CU11)"}
$CU12 {"Exchange Server 2016 Cumulative Update 12 (CU12)"}
default {"Update Sensor with new Exchange Version. Check https://docs.microsoft.com/de-de/exchange/new-features/build-numbers-and-release-dates?view=exchserver-2019#exchange-server-2016"}
}
#endregion

#region: XML Output for PRTG
Write-Host "<prtg>" 
if($Version -eq $Preview){$Count=1}else{$count="0"}
Write-Host "<result>"
               "<channel>Exchange Server 2016 Preview</channel>"
               "<value>$Count</value>"
               "</result>"
               "<text>$Text</text>"
               if($Version -eq $RTM){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 RTM</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU1){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU1</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU2){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU2</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU3){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU3</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU4){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU4</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU5){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU5</channel>"
               "<value>$Count</value>"
               "</result>"
               "<text>Exchange Server 2016 CU5</text>"
if($Version -eq $CU6){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU6</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU7){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU7</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU8){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU8</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU9){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU9</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU10){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU10</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU11){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU11</channel>"
               "<value>$Count</value>"
               "</result>"
               if($Version -eq $CU12){[string]$Count='1'}else{[string]$count='0'}
###############################################################################################################
#Insert new Version above this line
###############################################################################################################
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU12</channel>"
               "<value>$Count</value>"
               "</result>"
               Write-Host "</prtg>" 
#endregion