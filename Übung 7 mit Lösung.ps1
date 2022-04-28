# Finde alle AD Benutzer der Marketing Abteilung. Nutze dabei den Befehl
Get-ADUser -Filter {Department -eq "Marketing"} -Properties Department

# Speichere alle Benutzer der Marketing Abteilung in eine Variable. Nutze die Variable $MarketingUsers
$MarketingUsers = Get-ADUser -Filter {Department -eq "Marketing"} -Properties Department

# Welchen Typ hat $MarketingUsers?
$MarketingUsers.GetType()

# Wieviele Benutzer der Marketing Abteilung gibt es?
$MarketingUsers.Count
# 52

# Wie heißt der erste Benutzer der Marketing Abteilung?
$MarketingUsers[0]
# Lizzie Terrell

# Die Firma strukturiert sich neu! Die Marketing Abteilung gehört jetzt zum Business Development.
# Ändere bei Benutzern die Abteilung von "Marketing" in "Business Development"!
$MarketingUsers | Set-ADUser -Department "Business Development"

# Hat's geklappt?
Get-ADUser -Filter {Department -eq "Marketing"} -Properties Department
Get-ADUser -Filter {Department -eq "Business Development"} -Properties Department


# Erzeuge ein Array $Computers und schreibe die Namen "LON-DC1" und "LON-DC2" hinein!
[System.Collections.ArrayList]$Computers = @("LON-DC1","LON-DC2")

# Füge den Name "LON-SVR1" zum Array hinzu!
$Computers.Add("LON-SVR1")

# Entferne "LON-DC2" vom Array!
$Computers.Remove("LON-DC2")

# Teste die Netzwerkverbindung zu den Computern im Array!
Test-Connection -ComputerName $Computers
$Computers | Test-NetConnection