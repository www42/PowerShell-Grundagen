
#region Step 1 Oneliner

get-service -Name bits -ComputerName lon-dc1

#endregion

#region Step 2 Variables

$Service = "bits"
$ComputerName = "LON-DC1"
Get-Service -Name $Service -ComputerName $ComputerName

#endregion

#region Step 3 Parameters

param ($Service,$ComputerName) 
Get-Service $Service -ComputerName $ComputerName

#endregion

#region Step 4 Parameters fancy

param ( 
[Parameter(Mandatory=$true)][string]$Service,
[Parameter(Mandatory=$false)][string]$ComputerName = "LON-CL1"
)

Get-Service $Service -ComputerName $ComputerName

#endregion

#region Step 5 Function

function Get-MyService {
    param ( 
    [Parameter(Mandatory=$true)][string]$Service,
    [Parameter(Mandatory=$false)][string]$ComputerName = "LON-CL1"
    )
    Get-Service $Service -ComputerName $ComputerName
}

#endregion

#region Step 6 Stufe Modul

$env:PSModulePath
$ModuleRoot = $env:PSModulePath.Split(";")[0]
$ModuleName = "foo"
$ModulePath = Join-Path $ModuleRoot $ModuleName
New-Item -ItemType Directory -Path $ModulePath

Copy-Item -Path foo.ps1 -Destination $ModulePath\foo.psm1

#endregion

