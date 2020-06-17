<#
===================================================================================
Paessler PRTG Sensor to check Exchange Server Version
===================================================================================
Autor:        Stefan Redlin
Script:       CheckExchangeVersion_2019.ps1
Version:      1.0
Date:         20.04.2020
Environment:  Windows Server 2019/Exchange2019
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
#>

#region
param(
$ExchangeServer
)
#endregion

#region: Exchange Version List from https://docs.microsoft.com/de-de/exchange/new-features/build-numbers-and-release-dates?view=exchserver-2019#exchange-server-2019
$Preview = "15.2.196.0"
$RTM = "15.2.221.12"
$CU1 = "15.2.330.5"
$CU2 = "15.2.397.3"
$CU3 = "15.2.464.5"
$CU4 = "15.2.529.5"
$CU5 = "15.2.595.3"
$CU6 = "15.2.659.4"
#endregion



#region Query Exchange Server for Version
$result = Invoke-Command -ComputerName $ExchangeServer -ScriptBlock {$query = Get-Command Exsetup.exe | select Version
$query}
$Version = $result.version.ToString()
#endregion

#region: Generate text for sensor
$Text= switch ($Version){

$Preview {"Exchange Server 2019 Preview"}
$RTM {"Exchange Server 2019 RTM"}
$CU1 {"Exchange Server 2019 Cumulative Update 1 (CU1)"}
$CU2 {"Exchange Server 2019 Cumulative Update 2 (CU2)"}
$CU3 {"Exchange Server 2019 Cumulative Update 3 (CU3)"}
$CU4 {"Exchange Server 2019 Cumulative Update 4 (CU4)"}
$CU5 {"Exchange Server 2019 Cumulative Update 5 (CU5)"}
$CU6 {"Exchange Server 2019 Cumulative Update 6 (CU6)"}

default {"Update Sensor with new Exchange Version. Check https://docs.microsoft.com/de-de/exchange/new-features/build-numbers-and-release-dates?view=exchserver-2019#exchange-server-2019"}
}
#endregion

#region: XML Output for PRTG
Write-Host "<prtg>" 
Write-Host "<result>"
if($Version -eq $Preview){$Count=1}else{$count="0"}
               "<channel>Exchange Server 2019 Preview</channel>"
               "<value>$Count</value>"
               "</result>"
               "<text>$Text</text>" 
Write-Host "<result>"
if($Version -eq $RTM){$Count=1}else{$count=0}
               "<channel>Exchange Server 2019 Preview</channel>"
               "<value>$Count</value>"
               "</result>"          
Write-Host "<result>"
if($Version -eq $RTM){$Count=1}else{$count=0}
               "<channel>Exchange Server 2019 RTM</channel>"
               "<value>$Count</value>"
               "</result>"              
Write-Host "<result>"
if($Version -eq $CU1){$Count=1}else{$count=0}
               "<channel>Exchange Server 2019 CU1</channel>"
               "<value>$Count</value>"
               "</result>"              
Write-Host "<result>"
if($Version -eq $CU2){$Count=1}else{$count=0}
               "<channel>Exchange Server 2019 CU2</channel>"
               "<value>$Count</value>"
               "</result>"              
Write-Host "<result>"
if($Version -eq $CU3){$Count=1}else{$count=0}
               "<channel>Exchange Server 2019 CU3</channel>"
               "<value>$Count</value>"
               "</result>"          
Write-Host "<result>"
if($Version -eq $CU4){$Count=1}else{$count=0}
               "<channel>Exchange Server 2019 CU4</channel>"
               "<value>$Count</value>"
               "</result>"               
Write-Host "<result>"
if($Version -eq $CU5){$Count=1}else{$count=0}
               "<channel>Exchange Server 2019 CU5</channel>"
               "<value>$Count</value>"
               "</result>"
Write-Host "<result>"
if($Version -eq $CU6){$Count=1}else{$count=0}
               "<channel>Exchange Server 2019 CU6</channel>"
               "<value>$Count</value>"
               "</result>"
Write-Host "</prtg>" 
#endregion
