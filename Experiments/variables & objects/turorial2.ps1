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


<# PowerShell provides access to environment variables through its environment pro‐
vider. Providers let you work with data stores (such as the registry, environment vari‐
ables, and aliases) much as you would access the filesystem #>

# By default, PowerShell creates a drive (called env) that works with the environment
# provider to let you access environment variables. The environment provider lets you
# access items in the env: drive as you would any other drive: dir env:\variablename
# or dir env:variablename. If you want to access the provider directly (rather than go
# through its drive), you can also type dir Environment::variablename.
# However, the most common (and easiest) way to work with environment variables is
# by typing $env:variablename. This works with any provider but is most typically
# used with environment variables.
Get-Content env:systemroot

##  type Invoke-CmdScript Scriptname.cmd or Invoke-CmdScript Scriptname.bat

Set-StrictMode -Version 3
$files = Get-ChildItem
foreach($file in $files)
{
 $owner = (Get-Acl $file).Owner
 $file | Add-Member NoteProperty Owner $owner
 $file
}

##  Create and Initialize Custom Objects
### Creating a custom object
$output = [PSCustomObject] @{
    'User' = 'DOMAIN\User';
    'Quota' = 100MB;
    'ReportDate' = Get-Date;
   }
   $output.User

   $r = [PSCustomObject] @{
    Name = "Lee";
    Phone = "555-1212";
    SSN = "123-12-1212"
   }
   $r.PSTypeNames.Add("AddressRecord")
   Update-TypeData -TypeName AddressRecord -MemberType AliasProperty -Membername Cell -Value Phone