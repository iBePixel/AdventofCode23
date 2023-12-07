$input = Get-Content -Path 'C:\users\pixel\documents\github\adventofcode23\day 4\input.txt'
$input = $input -replace 'Card.+\:', ''
$total = 0


ForEach ($line in $input){
    $winningNos = @()
    $myNos = @()
    $score = 0

    $WinningVal = $line -replace '.{77}$'
    $WinningVal = $WinningVal -replace '  ', ' '
    $WinningVal = $WinningVal.TrimStart()
    $WinningVal = $WinningVal -split " "

    $myVals = $line -replace '^.{32}'
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
            if ($score -eq 0){
                $score = $score + 1
            }
            else {
                $score = ($score * 2)
            }
        }
    }

    $total = $total + $score 
    $total
}

$total 
