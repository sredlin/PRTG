<#
===================================================================================
Paessler PRTG Sensor to check Global Catalog Server
===================================================================================
Autor:        Stefan Redlin
Script:       CheckADDS_GlobalCatalog.ps1
Version:      1.0
Date:         08.05.2019
Environment:  Windows Server 2016
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
#>
$allDCs = (Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ }

$xmlOutput = '<?xml version="1.0" encoding="UTF-8" ?><prtg>'
foreach ($DC in $allDCs){
If((Get-ADDomainController -Server $DC.Name| select IsGlobalCatalog).IsGlobalCatalog -eq $true){$Count = "1"}else{$Count ="0"}
    $xmlOutput = $xmlOutput + "<result>
        <channel>$($DC)</channel>
        <value>$Count</value>
    </result>"
}
$xmlOutput = $xmlOutput + "</prtg>"
$xmlOutput
