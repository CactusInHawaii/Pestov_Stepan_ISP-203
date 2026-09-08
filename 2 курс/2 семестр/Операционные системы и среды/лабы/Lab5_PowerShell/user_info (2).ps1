"Имя компьютера: $env:COMPUTERNAME" | Out-File user_info.txt
"Пользователь: $env:USERNAME" | Out-File user_info.txt -Append
"Дата: $(Get-Date)" | Out-File user_info.txt -Append
