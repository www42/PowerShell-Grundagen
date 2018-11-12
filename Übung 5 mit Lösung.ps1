# WMI Datenbank abfragen
#-----------------------

# Die Serien-Nummer vom BIOS ermitteln.
Get-CimInstance -ClassName Win32_BIOS | select -ExpandProperty SerialNumber


# Alle Dienste ermitteln, die nicht laufen, die aber den Starttype  Automatisch haben. 
Get-CimInstance -ClassName Win32_Service | where {$_.State -ne "running" -and $_.StartMode -eq "Auto"}


# Zu jedem Dienst die zugehörigen Prozesse ermitteln.
Get-CimInstance -ClassName Win32_Service | where State -EQ "running" | 
    ForEach-Object {
        $foo =@{
                 ServiceName = $_.Name
                 ProcessId   = $_.ProcessId
                 ProcessName = Get-Process -Id $_.ProcessId | select -ExpandProperty Name
               }
        $foo
        Write-Output "-------------------------------------------------------------------"
    }