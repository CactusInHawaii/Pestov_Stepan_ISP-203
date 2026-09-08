Get-ChildItem C:\Windows -Recurse -File | Select FullName | Tee-Object ..\Pestov.txt
