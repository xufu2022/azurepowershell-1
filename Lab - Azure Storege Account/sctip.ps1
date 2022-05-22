#Connect-AzAccount -TenantId 7a2ec892-a4a3-4b1c-bf32-fd77fa210f6b

Disable-AzContextAutosave

$ResourceGroupName="powershell-grp"
$Location="North Europe"
New-AzResourceGroup -Name $ResourceGroupName -Location $Location