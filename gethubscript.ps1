param(    [parameter(mandatory=$true)][string]$scriptname
 ) 

$url = "https://github.com/zonzorp/COMP2101F15-01/raw/master/powershell/$scriptname"
$localdir = pwd
$localfile = "$localdir/$scriptname"
$webclient = New-Object -TypeName system.net.webclient
$webclient.UseDefaultCredentials = $true
$webclient.DownloadFile($url, $localfile)