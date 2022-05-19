# Object _ Custom objects

$course=[PSCustomObject]@{
    Id = 3
}

$course.Id

$generator = New-Object System.Random

$generator.NextDouble()

$today = Get-Date
$today.DayOfWeek