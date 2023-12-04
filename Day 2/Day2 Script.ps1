$input = Get-Content -Path 'C:\users\ElliottLamb\OneDrive - SquaredUp\documents\github\adventofcode23\day 2\input.txt'
$red = 12
$blue = 14
$green = 13
$result = 0
$games = @()

$part2Result = 0

ForEach($game in $input){
    $games += $game -replace('Game.+:', '')
}


for($i = 0; $i -lt 100; $i++){
    $CurrGame = $games[$i].split(';')
    $redArr = @()
    $blueArr = @()
    $greenArr = @()

    for($j = 0; $j -lt $CurrGame.length; $j++){
        $splitItems = $currGame[$j] -split','
        $redHand = 0
        $blueHand = 0
        $greenHand = 0
        ForEach ($val in $splitItems) {
            if($val -match 'red'){
                $redHand += $val -replace '\D+'
            }
            elseif($val -match 'green'){
                $greenHand += $val -replace '\D+'
            }
            elseif($val -match 'blue'){
                $blueHand += $val -replace '\D+'
            }
        }
        $greenArr += $greenHand
        $redArr += $redHand
        $blueArr += $blueHand
    }
    $maximumBlue = ($blueArr | Measure-Object -Maximum).Maximum
    $maximumRed = ($redArr | Measure-Object -Maximum).Maximum
    $maximumGreen = ($greenArr | Measure-Object -Maximum).Maximum

    $part2Result += ($maximumBlue * $maximumRed * $maximumGreen)

    if ($redArr -gt $red){
    }
    elseif ($blueArr -gt $blue){
    }
    elseif($greenArr -gt $green){
    }
    else{
        $result += ($i + 1)
    }
}

$result 
$part2Result