gwmi -class win32_logicaldisk | where-object size -gt 0 |format-table -autosize DeviceID,
        @{n="Size(GB)"; e={$_.size/1gb -as [int]}}, 
        @{n="Free(GB)"; e={$_.freespace/1gb -as [int]}},
        @{n="% Free"; e={100*$_.freespace/$_.size -as [int]}},
        ProviderName