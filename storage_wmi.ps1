get-wmiobject -class win32_logicaldisk
gwmi -class win32_logicaldisk |? size |ft -auto deviceid, size, freespace, providername 
gwmi -class win32_logicaldisk |? size |select-object deviceid, 
     @{n="Size(GB)";e={$_.size/1gb -as [int]}},
     @{n="Free(GB)";e={$_.freespace/1gb -as [int]}},
     @{n="% Free";e={100 * $_.freespace/$_.size -as [int]}},
     ProviderName |format-table -autosize