$head = gc "D:\Projects\MLBB-EquipmentPlanner\helper\head.txt"
$list = gc "D:\Projects\MLBB-EquipmentPlanner\helper\list.txt"
$tail = gc "D:\Projects\MLBB-EquipmentPlanner\helper\tail.txt"
$out = "D:\Projects\MLBB-EquipmentPlanner\helper\out.json"

foreach ($item in $list)
{
Write-Output "{`"item_name`":`"$item`","$tail"," | Out-File -append $out
}