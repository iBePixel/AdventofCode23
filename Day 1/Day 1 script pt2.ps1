$reference = Get-Content -Path 'C:\users\ElliottLamb\OneDrive - SquaredUp\Documents\WindowsPowerShell\Advent of Code\Day 1 input.txt'
$arrAll = @()
$result = 0

$reference = $reference -replace 'one', 'o1ne'
$reference = $reference -replace 'two', 't2wo'
$reference = $reference -replace 'three', 'th3ree' 
$reference = $reference -replace 'four', 'f4our'  
$reference = $reference -replace 'five', 'f5ive'
$reference = $reference -replace 'six', 's6ix'
$reference = $reference -replace 'seven', 's7even'
$reference = $reference -replace 'eight', 'e8ight'
$reference = $reference -replace 'nine', 'n9ine'



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