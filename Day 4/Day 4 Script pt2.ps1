$input = Get-Content -Path 'C:\users\pixel\documents\github\adventofcode23\day 4\input.txt'
$input = $input -replace 'Card.+\:', ''
$total = 0
$runs = 0
$iterations = @()
$result = 0
For($i=0; $i -lt $input.length -1; $i++){
    $iterations += 1
}

ForEach ($line in $input){
    $winningNos = @()
    $myNos = @()
    

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

    For ($k = 0; $k -lt $iterations[$runs]; $k++){
        $score = 0

        ForEach ($number in $myNos){
            if ($number -in $WinningNos){
                $score = $score + 1
            }
        }

        for($j = 1; $j -lt $score +1; $j++){
            $iterations[$runs + $j] = ($iterations[$runs + $j] + 1) 
        }
        $result = $result + $score 
    }
    $result = $result + 1
    $runs = ($runs + 1)
    $result 
}

$result 
