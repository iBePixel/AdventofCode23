$example = Get-Content -Path 'C:\users\ElliottLamb\OneDrive - SquaredUp\documents\github\adventofcode23\day 3\input.txt'
$symbols = '\@|\*|\+|\=|\$|\/|\&|\%|\-|\#'
$result = 0

For ($i =0; $i -lt 140; $i++){
    #Write-Host ($example[$i] | Select-String "\d+" -AllMatches).matches.value
    $matches = ($example[$i] | Select-String "\d+" -AllMatches).matches 
    
    ForEach ($match in $matches) {
        $numStart = $match.index
        $numEnd = $match.index + $match.length -1

        For ($j= $numStart -1; $j -lt $numEnd +1; $j++){
            if ($example[$i -1][$j] -match $symbols){
                $result += $match.value
                Write-Host "found" + $example[$i -1][$j]
            }
        }

        #if ($example[$i -1][($numStart)..($numEnd)] -match $symbols ){
         #   $result += $match.value
          #  Write-Host "help"
        #}
        #elseif ($example[$i][$numStart -1] -match $symbols){
         #   $result += $match.value
        #}
        #elseif ($example[$i][$numEnd +1] -match $symbols){
         #   $result += $match.value
        #}
        #else {

        #}
    }
    Write-Host $result
}

$result 