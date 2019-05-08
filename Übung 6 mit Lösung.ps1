# Welche Version des .Net Frameworks ist installiert?
#
# Tip: HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full
#      Property 'Release'
#
#      Tabelle https://msdn.microsoft.com/en-us/library/hh925568(v=vs.110)

$RegPath = 'HKLM:\SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full'

$DotNet = Get-ItemProperty -Path $RegPath -Name Release
$Release = $DotNet.Release

switch ($Release)
{
 "378389" {"4.5"}
 "378675" {"4.5.1"}
 "378758" {"4.5.1"}
 "379893" {"4.5.2"}
 "393295" {"4.6"}
 "393297" {"4.6"}
 "394254" {"4.6.1"}
 "394271" {"4.6.1"}
 "394802" {"4.6.2"}
 "394806" {"4.6.2"}
 "460798" {"4.7"}
 "460805" {"4.7"}
 "461308" {"4.7.1"}
 "461310" {"4.7.1"}
 "461808" {"4.7.2"}
 "461814" {"4.7.2"}
 "528040" {"4.8"}
 "528049" {"4.8"}
 Default  {"Unknown"}
}