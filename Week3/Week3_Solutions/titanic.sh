#!/bin/bash

input="titanic.dat.txt"

while read -r -a var
do
    mongosh 'myDB' --eval 'db.titanic.insert({class: "'"${var[0]}"'", age: "'"${var[1]}"'", sex: "'"${var[2]}"'", survived: "'"${var[3]}"'"})'
done < "$input"

# Note here that the solution is a little different from last time!
# We do not need to manually cut each line as it is read in as an array (-a option)
