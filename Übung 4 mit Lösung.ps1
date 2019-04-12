# Formatting Output
# -----------------

# Alle Prozesse, sortiert nach BasePriority, als Tabelle ausgegeben, gruppiert nach BasePriority
Get-Process | Sort-Object BasePriority | Format-Table -GroupBy BasePriority



# Tabelle aller Prozesse mit folgenden Spalten
#
# Id, Name, Paged Memory in MB, Virtual Memory in MB (2 Stellen nach dem Komma)
Get-Process | Format-Table -Property Id,Name,PM,VM

Get-Process | Format-Table -Property Id,Name,@{l="PM"; e={$_.PM}; a="right"},@{l="VM"; e={$_.VM}; a="right"}

Get-Process | Format-Table -Property Id,`
                                     Name,`
                                     @{l="PM"; e={$_.PM}; a="right"},`
                                     @{l="VM"; e={$_.VM}; a="right"}


Get-Process | Format-Table -Property Id,`
                                     Name,`
                                     @{l="PM (MB)"; e={$_.PM/1MB}; f="N2"; a="right"},`
                                     @{l="VM (MB)"; e={$_.VM/1MB}; f="N2"; a="right"}




# Dieselbe Tabelle abgespeichert in Procs.txt
Get-Process | Format-Table -Property Id,`
                                     Name,`
                                     @{l="PM (MB)"; e={$_.PM/1MB}; f="N2"; a="right"},`
                                     @{l="VM (MB)"; e={$_.VM/1MB}; f="N2"; a="right"} `
                                     | Out-File -FilePath "Procs.txt"


# Tabelle der IP Routen mit folgenden Spalten
#
# IP Familie, Metrik, Ziel Präfix
#
#
# (Ziel Präfix bitte rechtsbündig)
Get-NetRoute | Format-Table -Property AddressFamily,RouteMetric,DestinationPrefix

Get-NetRoute | Format-Table -Property AddressFamily,RouteMetric,@{l="DestinationPrefix"; e={$_.DestinationPrefix}; a="right" }