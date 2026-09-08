Clear-Host
Get-ChildItem *.txt | ForEach-Object { Get-Content $_.FullName }
Get-ChildItem