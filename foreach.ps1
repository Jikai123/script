foreach ($object in $collection) {
  "The current object looks kinda like a " + $object.gettype().name
}

$objects | foreach-object {
         "Wow, I got a "+ $_ + " from the pipeline!"}