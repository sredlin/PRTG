<#
===================================================================================
Paessler PRTG Sensor to check DHCP Scope
===================================================================================
Autor:        Stefan Redlin
Script:       CheckDHCP_Scope.ps1
Version:      1.0
Date:         08.05.2019
Environment:  Windows Server 2012R2/2016
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
#>

param(
[STRING]$serverName
)

$dhcpScopeStats = Get-DhcpServerv4ScopeStatistics -ComputerName $serverName

$xmlOutput = '<?xml version="1.0" encoding="UTF-8" ?><prtg>'

foreach ($scope in $dhcpScopeStats)
{
    $xmlOutput = $xmlOutput + "<result>
        <channel>Scope: $($scope.ScopeId) -PercentageInUse</channel>
        <value>$([math]::Round($scope.PercentageInUse))</value>
        <unit>Percent</unit>
        <limitmode>1</limitmode>
        <LimitMaxError>95</LimitMaxError>
        <LimitMaxWarning>90</LimitMaxWarning>
        <LimitErrorMsg>DHCP Scope is over 95%</LimitErrorMsg>
        <LimitWarningMsg>DHCP Scope is over 90%</LimitWarningMsg>
    </result>
    <result>
        <channel>Scope: $($scope.ScopeId)  -AddressesFree</channel>
        <unit>Custom</unit>
        <customUnit>IP</customUnit>
        <mode>Absolute</mode>
        <showChart>1</showChart>
        <showTable>1</showTable>
        <float>0</float>
        <value>  $($scope.AddressesFree) </value>                           
    </result>
    <result>
        <channel>Scope:  $($scope.ScopeId)  -AddressesInUse</channel>
        <unit>Custom</unit>
        <customUnit>IP</customUnit>
        <mode>Absolute</mode>
        <showChart>1</showChart>
        <showTable>1</showTable>
        <float>0</float>
        <value>  $($scope.AddressesInUse) </value>
    </result>
        <result>
        <channel>Scope: $($scope.ScopeId)  -ReservedAddress</channel>
        <unit>Custom</unit>
        <customUnit>IP</customUnit>
        <mode>Absolute</mode
        ><showChart>1</showChart>
        <showTable>1</showTable>
        <float>0</float>
        <value> $($scope.ReservedAddress) </value>
    </result>"
    
}

$xmlOutput = $xmlOutput + "</prtg>"

$xmlOutput