

$adapters = gwmi -Class win32_networkadapter
$adapters
$adapters[1,3,4]

$filteredadapters = $adapters |Where-Object adaptertype -Match ethernet
$filteredadapters

$filteredadapters | Select-Object Name,MACAddress,@{n="Speed(Mb)";e={$_.Speed/1000000 -as [int]}},Netenabled,PowerManagementSupported | Format-Table -AutoSize