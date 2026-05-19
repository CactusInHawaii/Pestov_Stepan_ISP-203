Get-PSDrive -PSProvider FileSystem | ForEach-Object {
    $total = [math]::Round(($_.Used + $_.Free) / 1GB)
    $free = [math]::Round($_.Free / 1GB)
    Write-Host "$($_.Name): $total ГБ всего, свободно $free ГБ"
}