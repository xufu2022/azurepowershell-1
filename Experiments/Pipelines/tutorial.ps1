# Pipeleine

    <#
         chain together multiple commands based on the success of previous commands in
    #>
    Invoke-Command localhost { "Some output" } && "Connection successful!"
    # Use the && and || pipeline chain operators:
    #   success of a command is determined by the $? automatic variable

    # Filter
    Get-Process | Where-Object { $_.Name -like "*Search*" }
    ## For simple comparisons on properties, you can omit the script block syntax and use the comparison parameters of Where-Object directly
    Get-Process | Where-Object Name -like "*Search*"

    
    #   In the script block, the $_ (or $PSItem) variable represents the current input object
        #   Get the first part of a list
            #F8 run selection
        (1..10).where( { $_ -eq 5 }, "Until" )

    ## Group and Pivot Data by Name

    #   Use the Group-Object cmdlet (which has the standard alias group) with the -AsHash and -AsString parameters. This creates a hashtable with the selected property (or expression) used as keys in that hashtable
    $h = dir | group -AsHash -AsString Length
    $h

    $processes = Get-Process
    $processes | Where-Object { $_.Id -eq 616 }
    $processes | Where-Object { $_.Id -eq 1216 }

    # instead use the -AsHash parameter of the Group-Object cmdlet to reuse
    $processes = Get-Process | Group-Object -AsHash Id
    $processes[1216]
    $processes[212]

#   Interactively Filter Lists of Objects
    $script = Get-History | ForEach-Object CommandLine | Out-GridView -PassThru
    $script | Set-Content c:\temp\script.ps1
#       By default, the Out-GridView cmdlet lets you select multiple items at once before pressing OK. If you’d rather constrain the selection to a single element, use Single as the value of the -OutputMode paramete

#   Work with Each
    1..10 | ForEach-Object { $_ * 2 }

    $myArray = 1,2,3,4,5
    $sum = 0
    $myArray | ForEach-Object { $sum += $_ }
    # Since you can also specify the -Begin, -Process, and -End parameters by position
    $myArray | ForEach-Object -Begin {
        $sum = 0 } -Process { $sum += $_ } -End { $sum }

    ## In PowerShell, the ForEach-Object cmdlet (and by extension its % alias) also supports parameters to simplify property and method access dramatically
    Get-Process | ForEach-Object Name
    Get-Process | % Name | % ToUpper

    ## foreach()
    (Get-Process).foreach("Name")
    ## Script block invocation
    $sum = 0
    (1..5).foreach( { $sum += $_ } )

    ## Type conversion
    $bytes = (1..5).foreach( [Byte] )

  # PowerShell supports the -PipelineVariable paramete

  Get-Process -PipelineVariable currentProcess | ForEach-Object {
    ## Get all of their modules (loaded DLLs)
    $_.Modules | ForEach-Object {
        ## If the DLL is loaded from AppData
        if($_.FileName -match 'AppData') {
            ## Output the process name
            $currentProcess
        }
    } | Select-Object -First 1
}

## Automatically Capture Pipeline Output
## Use the PSDefaultParameterValues automatic variable to set the -OutVariable parameter value of the Out-Default command to a variable name of your choice
    1..3 | Out-Default -OutVariable myOutput