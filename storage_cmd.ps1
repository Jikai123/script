get-psdrive
get-psdrive -psprovider filesystem
get-psdrive -psprovider filesystem |where-object {$_.used -or $_.free}
