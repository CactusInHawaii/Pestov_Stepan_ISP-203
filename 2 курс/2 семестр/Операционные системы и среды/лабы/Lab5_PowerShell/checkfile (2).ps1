if(Test-Path test.txt){Get-Content test.txt; Write-Host 'Файл прочитан'} 
else{Get-Date | Out-File test.txt; Write-Host 'Файл создан'}
