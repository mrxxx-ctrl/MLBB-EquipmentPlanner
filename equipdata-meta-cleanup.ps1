$base = "D:\Projects\MLBB-EquipmentPlanner"
$herolist = Get-Content -Raw -Path "$base\hero-list-test.json" | ConvertFrom-Json
#$herolist = Get-Content -Raw -Path "$base\hero-list.json" | ConvertFrom-Json
#$herolist.data

$uri = "https://mapi.mobilelegends.com/hero/detail?id="

$outfile = "$base\out.json"
$today = Get-Date -Format "MM-dd-yyyy"

$equipmentlist = Get-Content -Raw $outfile | ConvertFrom-Json
$equiplist = $equipmentlist.data | Sort-Object -Unique equipment_id
$equiplist | ConvertTo-Json
