<#
===================================================================================
Paessler PRTG Sensor to check FSMO Role Owner
===================================================================================
Autor:        Stefan Redlin
Script:       CheckADDS_FSMO.ps1
Version:      1.0
Date:         08.05.2019
Environment:  Windows Server 2016
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
#>
$ADForest = Get-ADForest  
$ADDomain  = Get-ADDomain 
$FSMO = New-Object -TypeName psobject 
$FSMO | Add-Member -MemberType NoteProperty -Name SchemaMaster -Value $ADForest.SchemaMaster
$FSMO | Add-Member -MemberType NoteProperty -Name DomainNamingMaster -Value $ADForest.DomainNamingMaster
$FSMO | Add-Member -MemberType NoteProperty -Name PDCEmulator -Value $ADDomain.PDCEmulator

$FSMO | Add-Member -MemberType NoteProperty -Name RIDMaster -Value $ADDomain.RIDMaster
$FSMO | Add-Member -MemberType NoteProperty -Name InfrastructureMaster -Value $ADDomain.InfrastructureMaster
$allDCs = (Get-ADForest).Domains | %{ Get-ADDomainController -Filter * -Server $_ }

$xmlOutput = '<?xml version="1.0" encoding="UTF-8" ?><prtg>'
foreach ($DC in $allDCs){
If(( $DC.HostName -eq $FSMO.SchemaMaster)){$Count = "1"}else{$Count ="0"}
    $xmlOutput = $xmlOutput + "<result>
        <channel>$($DC) - SchemaMaster</channel>
        <value>$Count</value>
    </result>"
If(( $DC.HostName -eq $FSMO.DomainNamingMaster)){$Count = "1"}else{$Count ="0"}
    $xmlOutput = $xmlOutput + "<result>
        <channel>$($DC) - DomainNamingMaster</channel>
        <value>$Count</value>
    </result>"
If(( $DC.HostName -eq $FSMO.PDCEmulator)){$Count = "1"}else{$Count ="0"}
     $xmlOutput = $xmlOutput + "<result>
        <channel>$($DC) - PDCEmulator</channel>
        <value>$Count</value>
    </result>"
If(( $DC.HostName -eq $FSMO.RIDMaster)){$Count = "1"}else{$Count ="0"}
     $xmlOutput = $xmlOutput + "<result>
        <channel>$($DC) - RIDMaster</channel>
        <value>$Count</value>
    </result>"
If(( $DC.HostName -eq $FSMO.InfrastructureMaster)){$Count = "1"}else{$Count ="0"}
    $xmlOutput = $xmlOutput + "<result>
        <channel>$($DC) - InfrastructureMaster</channel>
        <value>$Count</value>
    </result>"
}
$xmlOutput = $xmlOutput + "</prtg>"
$xmlOutput




