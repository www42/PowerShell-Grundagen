# Ctrl-J

gcm -Verb out
gcm -Verb format

Get-Service | select -First 5 | select name,status | 
    ConvertTo-Csv -NoTypeInformation -Delimiter ';' | 
    Out-File C:\temp\services.txt


Get-Process | sort vm -Descending | select -First 10 | ft Name,Id,VM

Get-Process | sort vm -Descending | select -First 10 | 
    ft Name,Id,@{l="VM in GB"; e={$_.VM/1GB}; f='N7'}


# WMI Database abfragen
Get-CimInstance -ClassName Win32_DiskDrive | select model,TotalCylinders

# PowerShell Laufwerke
# --------------------

Get-PSDrive