# Sortieren und Gruppieren nach einer Property
# --------------------------------------------

# Alle Dienste sortieren nach Anzeigenamen
Get-Service | Sort-Object -Property DisplayName

# Alle Dienste sortieren nach Status (Warum kommt Stopped vor Running?)
Get-Service | Sort-Object -Property Status

# Alle Prozesse sortieren nach CPU abfallend
Get-Process | Sort-Object -Property CPU -Descending

# Alle Prozesse sortieren nach CPU abfallend, nur die ersten 10
Get-Process | Sort-Object -Property CPU -Descending | Select-Object -First 10

# Alle Prozesse sortieren nach Memory (VM) abfallend, nur ID, Name und VM selektieren
Get-Process | Sort-Object -Property VM -Descending | Select-Object Id,Name,VM

# Alle Dienste gruppieren nach Starttype
Get-Service | Group-Object -Property StartType

# Alle Befehle gruppieren nach Verb
Get-Command | Group-Object -Property Verb | Sort-Object -Property Count -Descending

# Alle Dienste, die laufen
Get-Service | Where-Object Status -EQ "running"

# Alle Prozesse mit VM größer 2GB, sortiert nach VM, nur ID, Name, VM und StartTime selektieren
Get-Process | Where-Object VM -GT 2GB | Sort-Object -Property VM -Descending | Select-Object Id,Name,VM,StartTime