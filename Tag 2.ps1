# PowerShell Laufwerke

Get-PSDrive
Get-Command dir

dir c:\
dir HKCU:\
Get-Location
Set-Location hkcu:\
Get-Alias -Definition Set-Location

dir variable:
dir Variable:\PWD
$PWD
$Heute = Get-Date
dir variable:

# Certificates
dir cert:\
mmc
dir Cert:\CurrentUser\Root

# Registry
Get-PSDrive -PSProvider Registry
regedit

# Neuer Key (Schlüssel) = Item
New-Item -Path HKCU:\ -Name Test2
New-ItemProperty -Path HKCU:\Test2 -Name Value -Value 42 # dezimal 
New-ItemProperty -Path HKCU:\Test2 -Name Value2 -PropertyType string -Value 'foo'

Get-ItemPropertyValue -Path HKCU:\Test2 -Name Value


# WMI Database abfragen

Get-CimInstance -ClassName Win32_BIOS | select SerialNumber
Get-CimInstance -ClassName Win32_OperatingSystem | select Caption,BuildNumber | Format-List

# WMI-Befehle sind deprecated
Get-WmiObject -Class Win32_OperatingSystem



# PowerShell Remoting
# --------------------
dir wsman:

Get-Service -Name WinRM | select StartType

# Firewall muss Private sein
Get-NetConnectionProfile
Set-NetConnectionProfile -InterfaceAlias Ethernet0 -NetworkCategory Private

Enable-PSRemoting

dir WSMan:\localhost\Listener\Listener_1084132640

# Workgroup-Modell (Hosts sind nicht vertrauenswürdig)

# List der vertraunswürdigen Host
dir WSMan:\localhost\Client\TrustedHosts

$ServerIP = "192.168.146.129"
Test-NetConnection -ComputerName $ServerIP -CommonTCPPort WINRM

Set-Item -Path WSMan:\localhost\Client\TrustedHosts -Value $ServerIP

# Credential Object
$Cred = Get-Credential
$Cred


Enter-PSSession -ComputerName $ServerIP -Credential $Cred

  $env:COMPUTERNAME
  Get-CimInstance Win32_OperatingSystem | select Caption
  Exit-PSSession

# PSSessions auf Vorrat anlegen
$Server = New-PSSession -ComputerName $ServerIP -Credential $Cred

Enter-PSSession -Session $Server

Invoke-Command -Session $Server {Get-Service -Name BITS}