#!/bin/bash

if [ ! $# -eq 1 ]; then 
   echo “Correct usage: $0 \<filename\>”
   exit 1
fi

lectures=$1

if [ -e $lectures ]; then
   echo 'File '$lectures' exists'
else
   echo 'File '$lectures' does not exist'
   exit 2
fi

if [ -s $lectures ]; then
   echo 'File '$lectures' exists and has size greater than 0'
else
   echo 'File '$lectures' does not exist or exists but size 0'
   exit 3
fi

if [ -r $lectures ]; then
   echo 'File '$lectures' is readable'
else
   echo 'File '$lectures' is not readable'
   exit 4
fi

echo `wc -l $lectures`

echo "================================================================="

while read lecture 
do
    echo $lecture
done < $lectures

echo "================================================================="

while read lecture 
do
    findlecture=$(echo $lecture | grep "Memory management")
    if [ $? -eq 0 ]; then
       echo "Found '$findlecture'"
    fi
done < $lectures

echo "================================================================="

while read lecture 
do
    findlecture=$(echo $lecture | grep "UNIX Sockets")
    if [ $? -eq 0 ]; then
       echo "Found '$findlecture'"
    fi
done < $lectures

echo "================================================================="

COUNT=0
while read lecture
do
    nwords=$(echo $lecture | wc -w)
    if [ $nwords -gt 5 ]; then
       echo "Found '$lecture' with number of words greater than 4"
       let COUNT=$COUNT+1
    fi
done < $lectures

if [ $COUNT -eq 0 ]; then
   echo "Found no lecture with number of words greater than 4"
fi

echo "================================================================="

COUNT=0
while read lecture
do
    nwords=$(echo $lecture | wc -w)
    if [ $nwords -gt 6 ]; then
       echo "Found '$lecture' with number of words greater than 5"
       let COUNT=$COUNT+1
    fi
done < $lectures

if [ $COUNT -eq 0 ]; then
   echo "Found no lecture with number of words greater than 5"
fi

echo "================================================================="

lecturescopy=lectures.bak
cp $lectures $lecturescopy
READ1=0
while read lecture1
do
    let SKIP=$READ1+1
    READ2=0
    while read lecture2
    do
        if [ $READ2 -lt $SKIP ]; then
           let READ2=$READ2+1
           continue
        fi
        nwords1=$(echo $lecture1 | wc -w)
        nwords2=$(echo $lecture2 | wc -w)
        if [ $nwords1 -eq $nwords2 ]; then
           echo "Found '$lecture1' and '$lecture2' with same number of words $nwords1"
        fi
        let READ2=$READ2+1
    done < $lecturescopy
    let READ1=$READ1+1
done < $lectures
rm $lecturescopy

exit 0
