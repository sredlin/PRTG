<#
===================================================================================
Paessler PRTG Sensor to check AAD Group Licensing
===================================================================================
Autor:        Stefan Redlin
Script:       Get-GroupLicensesErrors.ps1
Version:      1.0
Date:         20.05.2019
Environment:  Windows Server 2016
Scriptpath:   C:\Program Files (x86)\PRTG Network Monitor\Custom Sensors\EXEXML
Scripttype:   EXE/Script Advanced
https://docs.microsoft.com/en-us/azure/active-directory/users-groups-roles/licensing-ps-examples
#>





[CmdletBinding()] param(
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string] $O365User,
    [Parameter(Mandatory = $true)][ValidateNotNullOrEmpty()][string] $O365Pass

)

    #Check for 32 bit environment
if ($env:PROCESSOR_ARCHITECTURE -eq "x86") {
    # Launch script in 64 bit environment
    $ScriptParameter = "-O365User '$O365User' -O365Pass '$O365Pass' "
    if ($IncludeSku -ne $null) {
        $ScriptParameter += "-IncludeSku '$($IncludeSku -join "','")' "
    }
    if ($ExcludeSku -ne $null) {
        $ScriptParameter += "-ExcludeSku '$($ExcludeSku -join "','")' "
    }
    if ($ShowMySkus) {
        $ScriptParameter += "-ShowMySkus "
    }
    # Use Sysnative virtual directory on 64-bit machines
    Invoke-Expression "$env:windir\sysnative\WindowsPowerShell\v1.0\powershell.exe -file '$($MyInvocation.MyCommand.Definition)' $ScriptParameter"
    Exit
}



<# Function to raise error in PRTG style and stop script #>
function New-PrtgError {
    [CmdletBinding()] param(
        [Parameter(Position=0)][string] $ErrorText
    )

    Write-Host "<PRTG>
    <Error>1</Error>
    <Text>$ErrorText</Text>
</PRTG>"
   
}

# Create credential object
$O365Cred = New-Object System.Management.Automation.PSCredential -ArgumentList $O365User, ($O365Pass | ConvertTo-SecureString -AsPlainText -Force)

# Load Office 365 module
try {
    Import-Module MSOnline -ErrorAction Stop
} catch {
    New-PrtgError -ErrorText "Could not load PowerShell Module MSOnline"
}

# Connect to Office 365 using provided credential
try {
    Connect-MsolService -Credential $O365Cred -ErrorAction Stop
} catch {
    New-PrtgError -ErrorText "Error connecting to your tenant. Please check credentials"
}
$xmlOutput = '<?xml version="1.0" encoding="UTF-8" ?><prtg>'
$Groups = Get-MsolGroup -All | Where {$_.Licenses} 

foreach($Group in $Groups){
$Groupmembers =Get-MsolGroupMember -All -GroupObjectId $Group.ObjectId
$totalCount = 0;
$licenseAssignedCount = 0;
$licenseErrorCount = 0;
$groupLicenses = $Group.Licenses | Select -ExpandProperty SkuPartNumber


foreach($Groupmember in $Groupmembers){
$Users=Get-MsolUser -ObjectId $Groupmember.ObjectId


foreach($User in $Users){
$totalCount++

if($user.Licenses | ? {$_.GroupsAssigningLicense -ieq $Group.ObjectId })
        {
            $licenseAssignedCount++
        }
        #check if user has any licenses that failed to be assigned from this group
        if ($user.IndirectLicenseErrors | ? {$_.ReferencedObjectId -ieq $Group.ObjectId })
        {
            $licenseErrorCount++
        } 


}
}

    $xmlOutput = $xmlOutput + "<result>
        <channel>$($Group.DisplayName) - TotalUserCount</channel>
        <value>$($totalCount)</value>
    </result>"
     $xmlOutput = $xmlOutput + "<result>
        <channel>$($Group.DisplayName) - LicensedUserCount</channel>
        <value>$licenseAssignedCount</value>
    </result>"
         $xmlOutput = $xmlOutput + "<result>
        <channel>$($Group.DisplayName) - LicenseErrorCount</channel>
        <value>$licenseErrorCount</value>
    </result>"
}
$xmlOutput = $xmlOutput + "</prtg>"
$xmlOutput

