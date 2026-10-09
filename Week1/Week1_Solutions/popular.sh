#!/bin/bash

cp facebookdata-clean.csv facebook.csv

for((i=0;i<10;i++)); do
  sums[$i]=0
done

for line in $(tail -n +2 facebookdata-clean.csv | cut -d, -f8-15); do
  num_comments=$(echo $line | cut -d, -f1)
  num_shares=$(echo $line | cut -d, -f2)
  num_likes=$(echo $line | cut -d, -f3)
  num_loves=$(echo $line | cut -d, -f4)
  num_wows=$(echo $line | cut -d, -f5)
  num_hahas=$(echo $line | cut -d, -f6)
  num_sads=$(echo $line | cut -d, -f7)
  num_angrys=$(echo $line | cut -d, -f8)
  sum=$((num_comments + num_shares + num_likes + num_loves + num_wows + num_hahas + num_sads + num_angrys)) 
  
  if [ "$sum" -gt "${sums[0]}" ]; then
    sums[0]=$sum
    
    #now we sort a bit like bubble sort 
    for((i=0;i<9;i++)); do
      if [ "${sums[i]}" -gt "${sums[$((i+1))]}" ]; then 
        # swap
        temp=${sums[$i]}
        sums[$i]=${sums[$((i+1))]}
        sums[$((i+1))]=$temp
      fi
    done
  fi
done

for((i=0;i<10;i++)); do
  echo ${sums[$i]}
done