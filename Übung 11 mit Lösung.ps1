# Aktualisiere die PowerShell Hilfe im Hintergrund! Schau den Output an!
Start-Job   -Name "UpdateHelp" {Update-Help}
Get-Job     -Name "UpdateHelp"
Receive-Job -Name "UpdateHelp"


# Starte PowerShell ISE wenn der Benutzer sich anmeldet!

$TaskName    = "Start ISE"
$Path        = "\"
$AtLogon     = New-ScheduledTaskTrigger -AtLogOn
$StartISE    = New-ScheduledTaskAction -Execute PowerShell_ISE.exe
$CurrentUser = New-ScheduledTaskPrincipal -RunLevel Highest -LogonType Interactive -UserId 'Adatum\Administrator'

Register-ScheduledTask -TaskName  $TaskName `
                       -TaskPath  $Path `
                       -Trigger   $AtLogon `
                       -Principal $CurrentUser `
                       -Action    $StartISE