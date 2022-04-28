# Melde Dich an auf LON-CL1!
# --------------------------
# Finde heraus, ob auf LON-SVR1 die Netzwerk Ports 3389 (RDP) und 5985 (WinRM) erreichbar sind!
Test-NetConnection -ComputerName LON-SVR1 -CommonTCPPort WINRM    # ja
Test-NetConnection -ComputerName LON-SVR1 -CommonTCPPort RDP      # nein

# Finde heraus, ob auf LON-SVR1 der IIS (Internet Information Services) installiert ist.
# Installiere auf LON-SVR1 den IIS mit Standard Features!
Get-WindowsFeature     -Name Web-Server -ComputerName LON-SVR1
Install-WindowsFeature -Name Web-Server -ComputerName LON-SVR1


# Ersetze seine Standard Home Page mit einer HTML Seite, welche anzeigt "Hello World from LON-SVR1"!
#
# Tipp 1: Die Standard Home Page ist C:\Inetpub\wwwroot\iisstart.htm
#
# Tipp 2: 
#          <html><body><h1>  </h1></body></html>

$SVR1 = New-PSSession -ComputerName LON-SVR1
Invoke-Command -Session $SVR1 {
    Remove-Item -Path C:\inetpub\wwwroot\iisstart.htm
    Add-Content -Path C:\inetpub\wwwroot\iisstart.htm -Value "<html><body><h1>Hello World from $env:COMPUTERNAME</h1></body></html>"
}




# Melde Dich an auf LON-SVR1!
# ---------------------------
# Lege im Active Directory eine neue OU an mit dem Name "Test"!

Invoke-Command -ComputerName LON-DC1 {New-ADOrganizationalUnit -Name "Test"}
# oder
$DC1 = New-PSSession -ComputerName LON-DC1
Import-Module -Name ActiveDirectory -PSSession $DC1
New-ADOrganizationalUnit -Name "Test"