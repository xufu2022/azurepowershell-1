# Variable & Objects

##  To display detailed information about an item, pass that item to the Format-List
## cmdlet. For example, to display an error in list format, type the following commands:


$currentError = $error[0]
$currentError | Format-List -Force

Get-Process pwsh | Format-List *

##  Format-Table, Format-List, Format-Wide, and Format-Custom

##  To display all properties of the item, type Format-List *


#  try to avoid calling the formatting cmdlets in the middle of a script or pipeline. When you do this, the output of your script no longer lends itself to the object-based manipulation so synonymous with PowerShell.
Get-Process PowerShell | Format-List | Sort-Object Name

Get-Process | Format-Table Name,WS
Get-Process | Format-Table Name,WS -Auto    # most readable manner, supply the -Auto flag 

##  Access Environment Variables
Get-ChildItem env:
##  get an environment variable using a more concise syntax
$env:variablename

##  To get an environment variable using its provider path, supply env: or Environment:: to the Get-ChildItem cmdlet:
Get-ChildItem env:variablename
Get-ChildItem Environment::variablename


