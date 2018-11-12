$Users = Import-Csv -Path .\ImportADUser.csv

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
              -AccountPassword (ConvertTo-SecureString $User.Password -AsPlainText -Force) `              -Enabled:$true }           