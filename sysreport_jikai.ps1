"-----------------------+"
"| Operating System Info |"
"+-----------------------+"

gwmi -class win32_operatingsystem | select -property Manufacturer, caption, version, OSArchitecture, registereduser, serialnumber

"+---------+"
"| PC Info |"
"+---------+"

Get-WmiObject -Class Win32_computersystem | Select-Object -Property Manufacturer, model, caption, domain, primaryownername, systemtype

"+-----------+"
"| BIOS Info |"
"+-----------+"

Get-WmiObject -Class Win32_Bios | Select-Object -Property manufacturer, Description, Version, SMBBIOSBIOSVersion, SerialNumber


"+----------------+"
"| Processor Info |"
"+----------------+"

Get-WmiObject -Class Win32_Processor | Select-Object -Property Manufacturer, name, caption, numberofcores, maxclockspeed, L2cachesize, L3cachesize




"+-------------+"
"| Memory Info |"
"+-------------+"

$totalcapacity = 0
gwmi -class win32_physicalmemory |
foreach {
           new-object -typename psobject -property @{
                 Manufacturer = $_.manuffacturer
                 "Speed(MHz)" = $_.speed
                 "Size(MB)" = $_.capacity/1mb
                 Bank = $_.banklabel
                 Slot = $_.devicelocator
            }
            $totalcapacity += $_.capacity/1mb
}|
ft -auto Manufacurer, "Size(MB)", "Speed(MHZ)", Bank, Slot

"Total RAM:${totalcapacity}MB"


"+---------------------+"
"| Network Connections |"
"+---------------------+"
"XXXX"
$adapters = gwmi -class win32_networkadapter
$defaultGW = gwmi -class win32_networkadapterconfiguration -filter IPEnabled=$true | select -property DefaultIPGateway
$filteradapters = $adapters | where-object adaptertype -match ethernet
$filteradapters | select Name, 
                         @{n = "MAC";e = {$_.MACAddress} }, 
                         @{n = "Speed(MB)";e = {$_.Speed/1000000 -as [int]}}
                         @{n = "GW";e = $defaultGW} | 
                  ft -autosize




"+------------+"
"| Disk Usage |"
"+------------+"

gwmi -class win32_logicaldisk | where size -gt 0 | ft -autosize DeviceID,
        @{n="Size(GB)"; e={$_.size/1gb -as [int]}},
        @{n="Free(GB)"; e={$_.freespace/1gb -as [int]}},
        @{n="% Free"; e={100*$_.freespace/$_.size -as [int]}},
        ProviderName




"+---------------------+"
"| Configured Printers |"
"+---------------------+"

Get-WmiObject -class win32_printer |
   select @{n="Status";e={switch($_.printerstatus){1{$stat="other"}
                                                   2{$stat="unknown"}
                                                   3{$stat="idle"}
                                                   4{$stat="printing"}
                                                   5{$stat="warming up"}
                                                   6{$stat="stopped printing"}
                                                   7{$stat="offline"}};
                                                   $stat}},
          @{n="Shared";e={if($_.attributes -band 8){$attr="shared"};$attr}},
          @{n="Default";e={if($_.attributes -band 4){$attr="default"};$attr}},
          name|
   ft -AutoSize





"+--------------------+"
"| Installed Software |"
"+--------------------+"

gwmi -class win32_product |ft -autosize installdate, vendor, description

">>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>"
  "Thank you for Your Teaching"
"<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<<"









