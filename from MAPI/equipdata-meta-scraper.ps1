$base = "D:\Projects\MLBB-EquipmentPlanner"
#$herolist = Get-Content -Raw -Path "$base\hero-list-test.json" | ConvertFrom-Json
$herolist = Get-Content -Raw -Path "$base\hero-list.json" | ConvertFrom-Json
$herolist.data

$uri = "https://mapi.mobilelegends.com/hero/detail?id="

$outfile = "$base\out.json"
$today = Get-Date -Format "MM-dd-yyyy"

function head {

    Write-Host 
    "{
        `"orig-source`":`"$uri`",
        `"pull-date`":`"$today`",
        `"data`":["| Out-File -Append $outfile
}

function scrape {

    foreach($hero in $herolist.data)
        {
        #construct path
        $path = $uri+$hero.heroid

        #pull data
        $response = Invoke-RestMethod -uri $path
        $raw = $response.data.gear.out_pack | Select-Object | ConvertTo-Json #| Out-File -Append $outfile
        

         #format delimiter
        if ($hero -eq $herolist.data[-1]){
            $raw = $raw.replace("]","")
            $raw = $raw.replace("[","")
            Write-Host 
            $raw+"]}" | Out-File -Append $outfile
            
            
            } else {
             Write-Host 
            $raw = $raw.replace("]","")
            $raw = $raw.replace("[","")               
            $raw+"," | Out-File -Append $outfile
            }
       
        
        }
}



if(test-path $outfile){
    Remove-Item $outfile
    head
    scrape
    } else {
    head
    scrape
    }

$equipmentlist = Get-Content -Raw $outfile | ConvertFrom-Json
$equiplist = $equipmentlist.data | Sort-Object -Unique equipment_id
$equiplist | ConvertTo-Json | Out-File $outfile