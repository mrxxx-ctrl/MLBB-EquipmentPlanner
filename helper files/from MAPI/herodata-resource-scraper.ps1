$base = "D:\Projects\MLBB-EquipmentPlanner"
$herolist = Get-Content -Raw -Path "$base\hero-list-test.json" | ConvertFrom-Json
$herolist.data

foreach($hero in $herolist.data)
{
$hero.heroid
}