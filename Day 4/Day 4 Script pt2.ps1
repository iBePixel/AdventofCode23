$input = Get-Content -Path 'C:\users\ElliottLamb\OneDrive - SquaredUp\documents\github\adventofcode23\day 4\input.txt'
$input = $input -replace 'Card.+\:', ''
$total = 0
$counter = 0

For ($j = 0; $j -lt $input.length; $j++){
    $winningNos = @()
    $myNos = @()
    $score = 0

    $WinningVal = $input[$j] -replace '.{77}$'
    $WinningVal = $WinningVal -replace '  ', ' '
    $WinningVal = $WinningVal.TrimStart()
    $WinningVal = $WinningVal -split " "

    $myVals = $input[$j] -replace '^.{32}'
    $myVals = $myVals -replace '  ', ' '
    $myVals = $myVals.TrimStart()
    $myVals = $myVals -split " "

    ForEach($num in $WinningVal){
        $WinningNos += $num
    }

    ForEach ($no in $myVals){
        $myNos += $no 
    }

    ForEach ($number in $myNos){
        if ($number -in $WinningNos){
                $score = $score + 1
        }
    }
    if ($score -gt 0){
        for($i = 1; $i -lt $score; $i++){
            $input += $input[$counter + $i]
        }
    $counter = $counter +1
    $total = $total + 1
    }
}

$total 
