#!/bin/bash

function dotp {
  
   declare -a A
   declare -a B
   declare -a C

   for i in {0..99}
   do
      A[$i]=$i
      B[$i]=$( expr 100 - $i )
   done

   for i in {0..99}
   do
      C[$i]=$[ ${A[$i]} * ${B[$i]} ]
   done

   echo -n "Result array C: "
   for i in {0..99}
   do
      echo -n "${C[$i]} "
   done
   echo
}

echo "Dot product of two arrays..."
dotp
