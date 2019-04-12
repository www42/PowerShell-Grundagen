# WMI Datenbank abfragen
#-----------------------

# Die Serien-Nummer vom BIOS ermitteln.
Get-CimInstance -ClassName Win32_BIOS | Select-Object -Property SerialNumber



# Alle Dienste ermitteln, die nicht laufen, die aber den Starttype  Automatisch haben. 
Get-CimInstance -ClassName Win32_Service | Where-Object {$_.State -ne "running" -and $_.StartMode -eq "auto"}



# Zu jedem Dienst die zugehörigen Prozesse ermitteln.
Get-CimInstance -ClassName Win32_Service | where State -EQ "running" |

    ForEach-Object {
       $ServiceName = $_.Name
       Write-Output "Service Name: $ServiceName"

       $ProcessId = $_.ProcessId
       Write-Output "Process Id  : $ProcessId"
       
       $ProcessName = Get-Process -Id $_.ProcessId | select -ExpandProperty Name
       Write-Output "Process Name: $ProcessName"

       Write-Output "--------------------------------------------"
    }