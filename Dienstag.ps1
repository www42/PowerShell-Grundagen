# Es gibt nur drei wichtige Befehle (Jeff Snover)

# 1)  Get-Command
# 2)  Get-Help
# 3)

Get-Command -Noun Help
Update-Help

Get-Help about*

Get-Service

# Filtern mit Where-Object
# ------------------------

# geht immer
Get-Service | Where-Object {$_.Status -eq "running"}

# ab 3.0
Get-Service | Where-Object Status -eq "running"

Get-Service -Name BITS
Get-Service -Name BITS | Get-Member






$Heute = Get-Date
$Weihnachten = Get-Date -Day 24 -Month 12 -Year 2019 -Hour 19 -Minute 00

$TageBisWeihnachten = ($Weihnachten - $Heute).Days

Write-Output "Noch $TageBisWeihnachten Tage bis Weihnachten."