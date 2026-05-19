New-Item Report -ItemType Directory -Force | Out-Null
$f = 'Report\Processes_2026-05-19.txt'
Get-Process | Select Name,Id,@{n='Memory';e={[math]::Round($_.WorkingSet64/1MB,1)}} | Out-File $f
Write-Host 'Отчёт создан. Процессов:' (Get-Process).Count
