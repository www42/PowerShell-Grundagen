# --------------------------------------------------
# ZoomIt
Invoke-WebRequest -Uri https://download.sysinternals.com/files/ZoomIt.zip -OutFile "$env:TEMP\zoomit.zip"
Expand-Archive -Path "$env:TEMP\zoomit.zip" -DestinationPath C:\windows\System32
zoomit64

# --------------------------------------------------
# Hashtable
$foo = @{ComputerName = "LON-DC1"; Port = 5985}
$foo.GetType()
Test-NetConnection @foo  # Splatting

# Hashtable --> PS Object
$bar = New-Object -TypeName psobject -Property $foo
$bar.GetType()
$bar | Test-NetConnection # ByPropertyName

# alternativ
$bar = [PSCustomObject]@{
    ComputerName = "LON-DC1"
    Port = 5985
}

# --------------------------------------------------
# Format operator
$pi # 3,14159265358979
$pi = [System.Math]::PI
[System.Math]::E

$a = @('foo')
$a.GetType()
$a += 'bar'
$a.count
$a += [System.Math]::PI
$a =+ [Math]::E
$a =+ [Math]::PI
$a.GetType()
$a | gm

'{0,-12:N20}' -f ($pi); "foo"