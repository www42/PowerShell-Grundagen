# PowerShell Grundlagen
# ---------------------

# Montag

# Verb-Noun -Parameter  Syntax
Get-Date -Day 24 -Month 12 -Year 2020

Get-Command -Name cd
Get-Command cd

Get-Command -Noun help
Update-Help

Get-Service -Name BITS
Get-Help Get-Service

# -Name --> positional parameter
Get-Service -Name bits,netlogon
Get-Service       bits,netlogon

Get-Service -DisplayName Anmeldedienst
Get-Service              Anmeldedienst

# Object Oriented Scripting

Get-Service -Name BITS
Get-Service -Name BITS | Format-List -Property *
Get-Service -Name BITS | Format-List *
Get-Service -Name BITS | fl *

# Properties abfragen
(Get-Service -Name BITS).Name
(Get-Service -Name BITS).DisplayName
(Get-Service -Name BITS).Status

# Methods anwenden
(Get-Service -Name BITS).Stop()

# Get-Member
Get-Service | Get-Member -MemberType Methods
Get-Alias -Definition Get-Member

# Arbeiten in der Pipeline: Sortieren, Selektieren, Filtern
# ---------------------------------------------------------
# Sortieren
Get-Service | Sort-Object -Property Status,DisplayName

Get-Service | Get-Member -Name status,displayname

# Gruppieren
Get-Service | Group-Object -Property Status

# Selektieren
Get-Service | Sort-Object DisplayName | Select-Object -First 10

Get-Service -Name BITS | Get-Member -MemberType Properties
Get-Service -Name BITS | Select-Object name,status
Get-Service -Name BITS | Select-Object name,status | Get-Member -MemberType Properties

# Filtern mit Jogi Löw
#
# alte Syntax - geht immer
Get-Service | Where-Object {$_.Status -eq "running" -and $_.Name -like "a*"}

# neue Syntax - geht ab PS 3.0


Get-Service | Where-Object Status -EQ "running" | Where-Object Name -Like "a*"


# Tage bis Weihnachten
# ---------------------

$Heute = Get-Date
$Weihnachten = Get-Date -Day 24 -Month 12 -Year 2019 -Hour 19 -Minute 00

$DiffBisWeihnachten = $Weihnachten - $Heute

$DiffBisWeihnachten.days



Get-NetFirewallRule | Format-Table -Property Name,Direction,Enabled
mkdir c:\temp

Get-NetFirewallRule `
    | Sort-Object Enabled `
    | Format-Table -Property Name,Direction,Enabled `
    | Out-File -FilePath c:\temp\fw.txt

# ---------------------------
# Filter left, format right!
# ---------------------------

# Zeilenumbruch maskieren mit back tic 

# / slash
# \ back slash
# ´ tic
# ` back tic
# ' single quote
# " double quote

Get-Service | Out-Printer -Name "Microsoft Print to PDF"
Get-Service | Out-Null
