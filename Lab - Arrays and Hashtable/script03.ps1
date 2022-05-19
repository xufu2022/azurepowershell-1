$myArray = 1,2,"Hello World"
$myArray

$jagged = @(
      (1,2,3,4),
      (5,6,7,8)
)

$jagged[0][1]

$myArray[2]=4
$myArray

$sum = 0
$myArray | ForEach-Object {$sum +=$_}
$sum

## HashTable
## Key/values

$myHashtable = @{ Key1 = "Value1"; "Key 2" = 1,2,3 }
$myHashtable["New Item"] = 5

$myHashtable.Key1

foreach($item in $myHashtable.GetEnumerator() | Sort-Object Name)
{
    $item.Value
}

$orderedHashtable = [Ordered] @{ Item1 = "Hello"; Item2 = "World" }
$orderedHashtable 

