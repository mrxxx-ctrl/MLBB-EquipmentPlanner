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
        $raw = $response.data | Select-Object | ConvertTo-Json #| Out-File -Append $outfile
        
         #format delimiter
        if ($hero -eq $herolist.data[-1]){
            Write-Host 
           "{
           `"name`":`""+$hero.name+"`",
           `"heroid`":`""+ $hero.heroid+"`",
           `"key`":`""+ $hero.key+"`",
           `"data`":[`n"+ 
                
            $raw+"`n]`n}`n]`n}" | Out-File -Append $outfile
            
            
            } else {
             Write-Host 
           "{
           `"name`":`""+$hero.name+"`",
           `"heroid`":`""+ $hero.heroid+"`",
           `"key`":`""+ $hero.key+"`",
           `"data`":[`n"+ 
                
            $raw+"`n]`n}," | Out-File -Append $outfile
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
