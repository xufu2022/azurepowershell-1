#

Disable-AzContextAutosave
Connect-AzAccount -TenantId 7a2ec892-a4a3-4b1c-bf32-fd77fa210f6b

## user service principal to avoid the username and pwd
$AppId="b7d9b456-f336-44b8-89fc-ca4ca454421a"
$AppSecret="LH58Q~3tJHpdQPj7N4ahS2yTONqYqa-bgp3mgbmi"

## pipe used to pass from one command to another command
$SecureSecret= $AppSecret | ConvertFrom-SecureString -AsPlainText -Force
$TenantId='7a2ec892-a4a3-4b1c-bf32-fd77fa210f6b'

$Credential=New-Object -TypeName System.Management.Automation.PSCredential `
-ArgumentList $AppId,$SecureSecret

Connect-AzAccount -TenantId 7a2ec892-a4a3-4b1c-bf32-fd77fa210f6b -ServicePrincipal -Credential $Credential -Tenant $TenantId



$ResourceGroupName="powershell-grp"
$Location="North Europe"

New-AzResourceGroup -Name $ResourceGroupName -Location $Location

Get-Help New-AzResourceGroup


# Active Directory is the identity provider of how you define your users, your groups, your application etc...

