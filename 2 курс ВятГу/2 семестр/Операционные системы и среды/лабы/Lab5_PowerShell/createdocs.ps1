New-Item MyDocuments -ItemType Directory -Force | Out-Null
'Файл 1' | Out-File MyDocuments\file1.txt
'Файл 2' | Out-File MyDocuments\file2.txt
'Файл 3' | Out-File MyDocuments\file3.txt
Write-Host 'Файлы созданы!'
