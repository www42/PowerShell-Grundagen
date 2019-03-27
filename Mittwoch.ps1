Get-Module -ListAvailable 
Get-Module -ListAvailable -Name activedirectory

$env:COMPUTERNAME
hostname

$DcIp = "192.168.146.129"

Test-NetConnection -ComputerName $DcIp -CommonTCPPort WINRM

$cred = Get-Credential

# adatum\administrator
# Pa55w.rd

$Dc = New-PSSession -ComputerName $DcIp -Credential $cred

Enter-PSSession -Session $Dc

Get-ADUser -filter *

Exit-PSSession

# Implicit Remoting
Import-Module -Name ActiveDirectory -PSSession $Dc

# AD Forest
Get-ADForest

# nur den ForestMode herauspicken als String
Get-ADForest | Select-Object -ExpandProperty ForestMode 
Get-ADForest | % ForestMode 

Get-ADForest | ForEach-Object {$_.ForestMode}
Get-ADForest | ForEach-Object ForestMode
Get-ADForest | % ForestMode


# Bemerkung am Rande: Snippets --> Ctl-J 


Get-ADDomain
Get-ADDomainController
Get-ADDomainController | % partitions

# Filter
Get-ADUser -Filter *
Get-ADUser -Filter {SamAccountName -eq "Administrator"}
Get-ADUser -Filter * | Where-Object SamAccountName -eq "Administrator"

Get-ADUser -Filter *               | Get-Member -MemberType Properties
Get-ADUser -Filter * -Properties * | Get-Member -MemberType Properties

Get-ADUser -Filter {SamAccountName -eq "Administrator"} -Properties * 
Get-ADUser -Filter * -Properties PasswordLastSet | ft samaccountname,PasswordLastSet,sid



$HeuteVor42Tagen = (Get-Date).AddDays(-42)

Get-ADUser -Filter {Enabled -eq $true} -Properties PasswordLastSet | 
    Where-Object PasswordLastSet -LT $HeuteVor42Tagen | ft samaccountname,PasswordLastSet,sid


# OUs
Get-Command -noun ADOrganizationalUnit
Get-ADOrganizationalUnit -Filter * | ft Name,DistinguishedName

New-ADOrganizationalUnit -Path "dc=adatum,dc=com" -Name GT

# Users
New-ADUser -GivenName Marie `
           -Surname Curie `
           -Name "Marie Curie" `
           -SamAccountName Marie `
           -OfficePhone 0815 `           -AccountPassword (ConvertTo-SecureString 'Pa55w.rd' -AsPlainText -Force) `           -ChangePasswordAtLogon:$true `           -Path "OU=GT,dc=adatum,dc=com" `           -Enabled:$true     # Export als csv, Trennzeichen --> ;  Get-ADUser -Filter * | Select-Object -Property GivenName,Surname,Name,SamAccountName,SID |   Export-Csv -Path ./ExportedUsers.csv  -NoTypeInformation  -Delimiter ';'# ComputerGet-ADComputer -Filter * -Properties *# Netzwerk config# früher ipconfig Get-NetIPAddressGet-NetIPAddress -AddressFamily IPv4 |     Format-Table InterfaceIndex,InterfaceAlias,IPAddress,PrefixLengthfunction Get-MyIpAddress 
{
 Get-NetIPAddress -AddressFamily IPv4 |     Format-Table InterfaceIndex,InterfaceAlias,IPAddress,PrefixLength   
}

Get-NetIPConfiguration

# früher ping
Test-NetConnection -ComputerName $DcIp
Test-NetConnection -ComputerName $DcIp -CommonTCPPort RDP

# nslookup
Resolve-DnsName -Name dc.adatum.com
Get-DnsClientServerAddress
Set-DnsClientServerAddress -ServerAddresses "192.168.146.129" -InterfaceAlias "Ethernet0"


# Windows 10 beitreten zu Domain

$cred = Get-Credential

Add-Computer -DomainName "adatum.com" -Credential $cred -Restart