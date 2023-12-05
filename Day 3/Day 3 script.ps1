$example = Get-Content -Path 'C:\users\pixel\documents\github\adventofcode23\day 3\input.txt'
$symbols = '\@|\*|\+|\=|\$|\/|\&|\%|\-|\#'
$result = 0

For ($i =0; $i -lt 140; $i++){
    $matches = ($example[$i] | Select-String "\d+" -AllMatches).matches 
    
    ForEach ($match in $matches) {
        $numStart = $match.index
        $numEnd = $match.index + $match.length -1

        For ($j= $numStart -1; $j -lt $numEnd +2; $j++){
            if ($example[$i -1][$j] -match $symbols){
                $result += $match.value
            }
            elseif ($example[$i][$j] -match $symbols){
                $result += $match.value
            }
            elseif ($example[$i + 1][$j] -match $symbols){
                $result += $match.Value
            }
        }
    }
}

$result 