[int]$startingnumber = 10
$mycount = $startingnumber
while ($mycount -gt 0) {
    "." * ($startingnumber - $mycount) + $mycount
    $mycount--
    sleep 1
}
" " * $startingnumber + "Done"