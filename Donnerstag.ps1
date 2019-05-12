# Security
Get-ExecutionPolicy
Set-ExecutionPolicy RemoteSigned -Force

# Profile Script anlegen
New-Item -ItemType File -Path $profile.CurrentUserAllHosts -Force
psedit $profile.CurrentUserAllHosts

# Module
(Get-Module -ListAvailable | Measure-Object).Count

$env:PSModulePath.Split(";")[0]  


function Get-MyIpAddress {

# Gibt die lokalen IP Adressen schoen aus.

Get-NetIPAddress -AddressFamily IPv4|
    Sort-Object InterfaceIndex | 
    Format-Table @{l='Index';e={$_.InterfaceIndex}},`                 InterfaceAlias, `
                 IPAddress, `                 @{l='Mask';e={$_.PrefixLength}}
}

$ModuleName     = "ToolBox"
$ModuleRoot     = $env:PSModulePath.Split(";")[0]
$ModuleFile     = "$ModuleRoot\$ModuleName\$ModuleName.psm1"
$ModuleManifest = "$ModuleRoot\$ModuleName\$ModuleName.psd1"

New-Item -ItemType File -Path $ModuleFile -Force
psedit $ModuleFile

New-ModuleManifest -Path $ModuleManifest
psedit $ModuleManifest

# Netzwerk
# --------
Get-MyIpAddress

Get-Command Get-MyIpAddress
Get-Help Get-MyIpAddress
Get-Command -Module ToolBox

Get-Module -Name dns* -ListAvailable

# WinRM einschalten
Enable-PSRemoting

# WinRM ausschalten
Disable-PSRemoting