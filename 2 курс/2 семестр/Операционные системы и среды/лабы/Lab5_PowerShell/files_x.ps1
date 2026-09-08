Get-ChildItem -Recurse -File | Where {$_.Extension -like '*x*'} | Select Name | Tee-Object ..\Pestov.txt
