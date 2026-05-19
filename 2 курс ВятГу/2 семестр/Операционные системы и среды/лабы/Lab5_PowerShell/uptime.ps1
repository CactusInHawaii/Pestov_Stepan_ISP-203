$os = Get-WmiObject Win32_OperatingSystem
"Последняя загрузка: $($os.LastBootUpTime)"
"Работает: $(Get-Date) - $($os.ConvertToDateTime($os.LastBootUpTime))"
