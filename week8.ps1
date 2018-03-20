get-date | fl * > mydata.txt #write the output to the mydata.txt file

new-item -itemtype directory foo | out-nell #throw away the output

new-item -path alias:np -value notepad  #create an alias "np" ->notepad, it stores in the "alias drive in RAM"

function myfunc { 
>>" This is my first function
>>}                                ###create a function

get-member -inputobject "this string" -Membertype property  #