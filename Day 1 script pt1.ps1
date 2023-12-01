$reference = Get-Content -Path 'C:\users\ElliottLamb\OneDrive - SquaredUp\Documents\WindowsPowerShell\Advent of Code\Day 1 input.txt'
$arrAll = @()
$result = 0
$numbers = $reference -replace '\D+'

ForEach($line in $numbers){
    
    if ($line.length -gt 1){
        $i = $line.length -1
        $joint = $line[0], $line[$i] -join ''
    }
    else{
        $joint = $line[0], $line[0] -join ''
    }
    $arrAll += $joint
}


ForEach($value in $arrAll){
    $result = $result + $value
}

$result 