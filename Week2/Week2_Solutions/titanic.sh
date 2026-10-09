#!/bin/bash

input="titanic.dat.txt"
while IFS= read -r var do
  class=`echo $var | cut -c1`
  age=`echo $var | cut -c10`
  sex=`echo $var | cut -c19`
  survived=`echo $var | cut -c28`
  mysql -D "aNewDB" -e "insert into titanic values($class, $age, $sex, $survived)" 
done < "$input"