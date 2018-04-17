param ( [Parameter(Mandatory=$true,position=1)][string]$sourcefile,
        [Parameter(Mandatory=$true,position=2)][string]$destinationfile)

"Sourcefile was '$sourcefile'"
$objtypename = $sourcefile.gettype().name
"Soucefile was a $objtypename object"


"Destinationfile was '$destinationfile'"
$objtypename = $destinationfile.gettype().name
"Destinationfile was a $objtypename object"