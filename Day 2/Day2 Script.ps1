$input = Get-Content -Path .\documents\'github\adventofcode23\day 2\input.txt'
$red = 12
$blue = 14
$green = 13
$result = 0
$games = @()

ForEach($game in $input){
    $games += $game -replace('Game.+:', '')
}


for($i = 0; $i -lt 99; $i++){
    $CurrGame = $games[$i].split(';')
    $redArr = @()
    $blueArr = @()
    $greenArr = @()

    for($j = 0; $j -lt $CurrGame.length; $j++){
        $splitItems = $currGame[$j] -split','
        ForEach ($val in $splitItems) {
            if($val -match 'red'){
                $redArr += $val -replace '\D+'
            }
            elseif($val -match 'green'){
                $greenArr += $val -replace '\D+'
            }
            elseif($val -match 'blue'){
                $blueArr += $val -replace '\D+' 
            }
            Write-Host $blueArr
            Write-Host $redArr
            Write-Host $greenArr
        }
        
    }
}