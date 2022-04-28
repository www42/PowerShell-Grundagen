
#region Step 1 Oneliner
# Schreib einen Befehl, der auf LON-DC1 den Dienst Bits abfragt!

Get-Service -Name Bits -ComputerName LON-DC1

#endregion

#region Step 2 Variables
# Ersetze Bits durch $Service und LON-DC1 durch $ComputerName
$Service = "Bits"
$ComputerName = "LON-DC1"
Get-Service -Name $Service -ComputerName $ComputerName

#endregion

#region Step 3 Parameters
# Schreib eine Parameterliste für $Service und $ComputerName
param ($Service,$ComputerName) 
Get-Service $Service -ComputerName $ComputerName

#endregion

#region Step 4 Parameters fancy
# Erzwinge in der Parameterliste, dass $Service einen Wert haben muss, 
# $ComputerName dagegen kann einen Wert bekommen.
# Falls kein Wert für $ComputerName übergeben wird soll LON-DC1 genommen werden.
param ( 
[Parameter(Mandatory=$true)][string]$Service,
[Parameter(Mandatory=$false)][string]$ComputerName = "LON-DC11"
)
Get-Service $Service -ComputerName $ComputerName

#endregion

#region Step 5 Function
# Mach aus dem Ganzen eine function mit dem Namen Get-MyService
function Get-MyService {
    param ( 
    [Parameter(Mandatory=$true)][string]$Service,
    [Parameter(Mandatory=$false)][string]$ComputerName = "LON-DC1"
    )
    Get-Service $Service -ComputerName $ComputerName
}

#endregion

#region Step 6 Module
# Erzeuge ein Module mit dem Namen MyTools und schreibe die function hinein!
$env:PSModulePath
$ModuleRoot = $env:PSModulePath.Split(";")[0]
$ModuleName = "MyTools"
$ModulePath = Join-Path $ModuleRoot $ModuleName
New-Item -ItemType File -Path $ModulePath\$ModuleName.psm1 -Force

psEdit $ModulePath\$ModuleName.psm1

#endregion
