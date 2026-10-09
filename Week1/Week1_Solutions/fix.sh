#!/bin/bash

cp facebookdata.csv facebookdata-clean.csv

while grep -q '"[^"][^"]*,.*"' facebookdata-clean.csv ;do
  sed -i.bak 's/\("[^"][^"]*\),\(.*"\)/\1;\2/' facebookdata-clean.csv
done