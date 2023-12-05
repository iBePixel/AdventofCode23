$example = Get-Content -Path 'C:\users\pixel\documents\github\adventofcode23\day 3\input.txt'
$symbols = '\*'
$array = @()

$result = 0

For ($i =0; $i -lt 140; $i++){
    $matches = ($example[$i] | Select-String "\d+" -AllMatches).matches 
    
    ForEach ($match in $matches) {
        $numStart = $match.index
        $numEnd = $match.index + $match.length -1

        For ($j= $numStart -1; $j -lt $numEnd +2; $j++){
            if ($example[$i -1][$j] -match $symbols){
                $array += New-Object PsObject -Property @{Line = $i -1; Index = $j; number = $match.value}
                #$array.add($match.value, ($i -1, $j))
            }
            elseif ($example[$i][$j] -match $symbols){
                $array += New-Object PsObject -Property @{Line = $i; Index = $j; number = $match.value}
                #$array.add($match.value, ($i, $j))
            }
            elseif ($example[$i + 1][$j] -match $symbols){
                $array += New-Object PsObject -Property @{Line = $i +1; Index = $j; number = $match.value}
                #$array.add($match.value, ($i +1, $j))
            }
        }
    }
}



$array = $array | Sort-Object line, index 
for ($k = 0; $k -lt $array.length; $k++){
    if($array[$k].line -match $array[$k +1].line -and $array[$k].index -match $array[$k +1].index){
        $num1 = $array[$k].number
        $num2 = $array[$k + 1].number 
        $result+= ([int]$num1 * [int]$num2)
    }
}

$result 