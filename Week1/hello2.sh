#!/bin/bash

if [ "$#" -eq 0 ]; then
  echo "No argument given!"
else
  for i in "$@"; do 
    echo "Hello $i!"
  done
fi