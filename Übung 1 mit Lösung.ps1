# Befehle finden
# --------------

# Finden Sie die PowerShell-Befehle, um folgendes anzuzeigen:

# Dienste 
Get-Service

# Prozesse
Get-Process

# Firewall-Regeln
Get-NetFirewallRule

# Datum
Get-Date

# Festplatten
Get-Disk

# Volumes
Get-Volume

# virtuelle Maschinen
Get-VM

# Ereignisse im Ereignisprotokoll
Get-EventLog
Get-WinEvent

# Befehle
Get-Command
	

# Mit Parametern filtern
# ----------------------

# Listen Sie auf:

# alle Dienste, deren Name mit A anfängt
Get-Service -Name A*

# alle Dienste, deren Displayname mit A anfängt
Get-Service -DisplayName A*

# alle Prozesse mit ID 0
Get-Process -Id 0

# alle Prozesse, deren Name die Zeichenkette host enthält
Get-Process -Name *host*

# alle Festplatten mit der Nummer 0
Get-Disk -Number 0

# alle Volumes mit dem Buchstaben C
Get-Volume -DriveLetter C

# die neuesten 10 Ereignisse aus dem Security Ereignisprotokoll
Get-EventLog -LogName Security -Newest 10

# alle Befehle mit dem Verb Get
Get-Command -Verb get

# alle Befehle mit dem Noun Service
Get-Command -Noun Service