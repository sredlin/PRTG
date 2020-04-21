 
<#
===================================================================================
Paessler PRTG Sensor to check Exchange Server Version
===================================================================================
Autor:        Stefan Redlin
Script:       CheckVersion_Exchange_2013.ps1
Version:      1.2
Date:         21.04.2020
Environment:  Windows Server 2016/Exchange2016
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
#>

#region: Exchange Server 
param(
$ExchangeServer
)
#endregion

#region: Exchange Version List from https://docs.microsoft.com/de-de/exchange/new-features/build-numbers-and-release-dates?view=exchserver-2019#exchange-server-2013
$Preview = "15.00.0466.013"
$RTM = "15.00.0516.032"
$CU1 = "15.00.0620.029"
$CU2 = "15.00.0712.024"
$CU3 = "15.00.0775.038"
$CU4 = "15.00.0847.032"
$CU5 = "15.00.0913.022"
$CU6 = "15.00.0995.029"
$CU7 = "15.00.1044.025"
$CU8 = "15.00.1076.009"
$CU9 = "15.00.1104.005"
$CU10 = "15.00.1130.007"
$CU11 = "15.00.1156.006"
$CU12 = "15.00.1178.004"
$CU13 = "15.00.1210.003"
$CU14 = "15.00.1236.003"
$CU15 = "15.00.1263.005"
$CU16 = "15.00.1293.002"
$CU17 = "15.00.1320.004"
$CU18 = "15.00.1347.002"
$CU19 = "15.00.1365.001"
$CU20 = "15.00.1367.003"
$CU21 = "15.00.1395.004"
$CU22 = "15.00.1473.003"
$CU23 = "15.00.1497.002"

#endregion



#region Query Exchange Server for Version
$result = Invoke-Command -ComputerName $ExchangeServer -ScriptBlock {$query = Get-Command Exsetup.exe | ForEach-Object {$_.FileVersionInfo}
$query}
$Version = $result.FileVersion.ToString()
$Version = $Version.Substring(0,10)
#endregion

#region: Generate text for sensor
$Text= switch ($Version){

$RTM.Substring(0,10) {"Exchange Server 2013 RTM"}
$CU1.Substring(0,10) {"Exchange Server 2013 Cumulative Update 1 (CU1)"}
$CU2.Substring(0,10) {"Exchange Server 2013 Cumulative Update 2 (CU2)"}
$CU3.Substring(0,10) {"Exchange Server 2013 Cumulative Update 3 (CU3)"}
$CU4.Substring(0,10) {"Exchange Server 2013 Cumulative Update 4 (CU4)"}
$CU5.Substring(0,10) {"Exchange Server 2013 Cumulative Update 5 (CU5)"}
$CU6.Substring(0,10) {"Exchange Server 2013 Cumulative Update 6 (CU6)"}
$CU7.Substring(0,10) {"Exchange Server 2013 Cumulative Update 7 (CU7)"}
$CU8.Substring(0,10) {"Exchange Server 2013 Cumulative Update 8 (CU8)"}
$CU9.Substring(0,10) {"Exchange Server 2013 Cumulative Update 9 (CU9)"}
$CU10.Substring(0,10) {"Exchange Server 2013 Cumulative Update 10 (CU10)"}
$CU11.Substring(0,10) {"Exchange Server 2013 Cumulative Update 11 (CU11)"}
$CU12.Substring(0,10) {"Exchange Server 2013 Cumulative Update 12 (CU12)"}
$CU13.Substring(0,10) {"Exchange Server 2013 Cumulative Update 13 (CU13)"}
$CU14.Substring(0,10) {"Exchange Server 2013 Cumulative Update 14 (CU14)"}
$CU15.Substring(0,10) {"Exchange Server 2013 Cumulative Update 15 (CU15)"}
$CU16.Substring(0,10) {"Exchange Server 2013 Cumulative Update 16 (CU16)"}
$CU17.Substring(0,10) {"Exchange Server 2013 Cumulative Update 17 (CU17)"}
$CU18.Substring(0,10) {"Exchange Server 2013 Cumulative Update 18 (CU18)"}
$CU19.Substring(0,10) {"Exchange Server 2013 Cumulative Update 19 (CU19)"}
$CU20.Substring(0,10) {"Exchange Server 2013 Cumulative Update 20 (CU20)"}
$CU21.Substring(0,10) {"Exchange Server 2013 Cumulative Update 21 (CU21)"}
$CU22.Substring(0,10) {"Exchange Server 2013 Cumulative Update 22 (CU22)"}
$CU23.Substring(0,10) {"Exchange Server 2013 Cumulative Update 23 (CU23)"}
default {"Update Sensor with new Exchange Version. Check https://docs.microsoft.com/de-de/exchange/new-features/build-numbers-and-release-dates?view=exchserver-2019#exchange-server-2016"}
}
#endregion

#region: XML Output for PRTG
Write-Host "<prtg>" 
               if($RTM -match $Version){$Count=1}else{$count="0"}              
Write-Host "<result>"
               "<channel>Exchange Server 2013 RTM</channel>"
               "<value>$Count</value>"
               "</result>"
               "<text>$Text</text>"
               if($CU1 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU1</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU2 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU2</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU3 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU3</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU4 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU4</channel>"
               "<value>$Count</value>"
               "</result>"
              if($CU5 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU5</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU6 -match $Version){$Count=1}else{$count=0}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU6</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU7 -match $Version){$Count='1'}else{$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU7</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU8 -match $Version){$Count='1'}else{$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU8</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU9 -match $Version){$Count='1'}else{$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU9</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU10 -match $Version){$Count='1'}else{$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU10</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU11 -match $Version){$Count='1'}else{$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU11</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU12 -match $Version){$Count='1'}else{$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU12</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU13 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU13</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU14 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU14</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU15 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU15</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU16 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU16</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU17 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU17</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU18 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU18</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU19 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU19</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU20 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU20</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU21 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU21</channel>"
               "<value>$Count</value>"
               "</result>"
               if($CU22 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU22</channel>"
               "<value>$Count</value>"
               "</result>"
			   if($CU23 -match $Version){[string]$Count='1'}else{[string]$count='0'}
Write-Host "<result>"
               "<channel>Exchange Server 2013 CU23</channel>"
               "<value>$Count</value>"
               "</result>"
Write-Host "</prtg>" 
#endregion

