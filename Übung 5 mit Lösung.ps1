# Welche Version des .Net Frameworks ist installiert?
# Tip: HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full"
Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" | Select-Object -Property Version



# Bei dem Benutzer den Registry Key\Software\Scripts anlegen 
# Dort den Eintrag "PSDriveName" (String) anlegen mit dem Wert "ScriptShare"

New-Item –Path HKCU:\Software –Name "Scripts"
New-ItemProperty -Path HKCU:\Software\Scripts -Name "PSDriveName" –Value "ScriptShare"


# Welche Root-Zertifikate (Benutzer) sind abgelaufen?
dir Cert:\CurrentUser\Root
dir Cert:\CurrentUser\Root | Get-Member -Name NotAfter
$Today = Get-Date
dir Cert:\CurrentUser\Root | Where-Object NotAfter -LT $Today | Sort-Object -Property NotAfter | Format-List Subject,NotAfter