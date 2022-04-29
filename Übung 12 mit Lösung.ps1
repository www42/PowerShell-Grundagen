# Erzeuge das PowerShell Profil für den aktuellen Benutzer, gültig für ISE und die (nackte) Konsole.
# Dieses Profil soll anzeigen, wieviele Tage es noch sind bis Weihnachten / bis Pfingsten / bis zum Geburtstag.

$MyProfile = $Profile.CurrentUserAllHosts
New-Item -ItemType File -Path $MyProfile -Force
psEdit $MyProfile

function Get-Weihnachten {
    $Today = Get-Date
    $Weihnachten = Get-Date -Date 24 -Month 12 -Year $Today.Year -Hour 20 -Minute 00
    $TageBisWeihnachten = ($Weihnachten - $Today).Days

    Write-Output "Noch $TageBisWeihnachten Tage bis Weihnachten."
}
Get-Weihnachten



# Importiere die Datei ADUser.csv und legen dazu die Benutzer in AD (Active Directory) an.
# Tipp: Überprüfe zuerst, ob die OU (Organizational Unit) existiert

$Users = Import-Csv -Path .\ADUser.csv

foreach ($User in $Users) {

   $OU = $User.OU
   $DN = "ou=$OU,dc=adatum,dc=com"

   try { Get-ADOrganizationalUnit -Identity $DN | Out-Null}
   catch { New-ADOrganizationalUnit -Name $OU -Path "dc=adatum,dc=com" }

   New-ADUser -Name $User.Name `
              -GivenName $User.Vorname `
              -Surname $User.Name `
              -OfficePhone $User.Tel `
              -Path $DN `
              -SamAccountName $User.LogonName `
              -AccountPassword (ConvertTo-SecureString $User.Password -AsPlainText -Force) `
              -Enabled:$true 
}
