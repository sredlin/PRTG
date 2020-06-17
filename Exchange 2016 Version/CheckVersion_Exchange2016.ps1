<#
===================================================================================
Paessler PRTG Sensor to check Exchange Server Version
===================================================================================
Autor:        Stefan Redlin
Script:       CheckExchangeVersion_2016.ps1
Version:      1.3
Date:         17.06.2020
Environment:  Windows Server 2016/Exchange2016
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
#>

#region
param(
$ExchangeServer
)
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
$CU13 = "15.1.1779.2"
$CU14 = "15.1.1847.3"
$CU15 = "15.1.1913.5"
$CU16 = "15.1.1979.3"
$CU17 = "15.1.2044.4"
#endregion



#region Query Exchange Server for Version
$result = Invoke-Command -ComputerName $ExchangeServer -ScriptBlock {$query = Get-Command Exsetup.exe | select Version
$query}
$Version = $result.version.ToString()
$Version = $Version.Substring(0,10)
#endregion

#region: Generate text for sensor
$Text= switch ($Version){

$Preview.Substring(0,10) {"Exchange Server 2016 Preview"}
$RTM.Substring(0,10) {"Exchange Server 2016 RTM"}
$CU1.Substring(0,10) {"Exchange Server 2016 Cumulative Update 1 (CU1)"}
$CU2.Substring(0,10) {"Exchange Server 2016 Cumulative Update 2 (CU2)"}
$CU3.Substring(0,10) {"Exchange Server 2016 Cumulative Update 3 (CU3)"}
$CU4.Substring(0,10) {"Exchange Server 2016 Cumulative Update 4 (CU4)"}
$CU5.Substring(0,10) {"Exchange Server 2016 Cumulative Update 5 (CU5)"}
$CU6.Substring(0,10) {"Exchange Server 2016 Cumulative Update 6 (CU6)"}
$CU7.Substring(0,10) {"Exchange Server 2016 Cumulative Update 7 (CU7)"}
$CU8.Substring(0,10) {"Exchange Server 2016 Cumulative Update 8 (CU8)"}
$CU9.Substring(0,10) {"Exchange Server 2016 Cumulative Update 9 (CU9)"}
$CU10.Substring(0,10) {"Exchange Server 2016 Cumulative Update 10 (CU10)"}
$CU11.Substring(0,10) {"Exchange Server 2016 Cumulative Update 11 (CU11)"}
$CU12.Substring(0,10) {"Exchange Server 2016 Cumulative Update 12 (CU12)"}
$CU13.Substring(0,10) {"Exchange Server 2016 Cumulative Update 13 (CU13)"}
$CU14.Substring(0,10) {"Exchange Server 2016 Cumulative Update 14 (CU14)"}
$CU15.Substring(0,10) {"Exchange Server 2016 Cumulative Update 15 (CU15)"}
$CU16.Substring(0,10) {"Exchange Server 2016 Cumulative Update 16 (CU16)"}
$CU17.Substring(0,10) {"Exchange Server 2016 Cumulative Update 17 (CU17)"}
default {"Update Sensor with new Exchange Version. Check https://docs.microsoft.com/de-de/exchange/new-features/build-numbers-and-release-dates?view=exchserver-2019#exchange-server-2016"}
}
#endregion

#region: XML Output for PRTG
Write-Host "<prtg>" 
                if($Preview -match $Version){$Count=1}else{$count="0"}
Write-Host "<result>"
               "<channel>Exchange Server 2016 Preview</channel>"
               "<value>$Count</value>"
               "</result>"
               "<text>$Text</text>"
               if($RTM -match $Version){$Count=1}else{$count="0"} 
Write-Host "<result>"
               "<channel>Exchange Server 2016 RTM</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU1 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU1</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU2 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU2</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU3 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU3</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU4 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU4</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU5 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU5</channel>"
               "<value>$Count</value>"
               "</result>"
               "<text>Exchange Server 2016 CU5</text>"
               if($CU6 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU6</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU7 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU7</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU8 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU8</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU9 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU9</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU10 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU10</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU11 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU11</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU12 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU12</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU13 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU13</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU14 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU14</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU15 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU15</channel>"
               "<value>$Count</value>"
               "</result>"
		if($CU16 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU16</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU17 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2016 CU17</channel>"
               "<value>$Count</value>"
               "</result>"
Write-Host "</prtg>" 
#endregion
