#!/bin/bash

mydc () {
   LINES=$1

   echo
   echo "===================================="
   echo " My $HOSTNAME"
   echo "===================================="

   echo
   echo "===================================="
   echo "Current time"
   echo "===================================="
   CURRENTT=$(date +"%x %r %Z")
   echo $CURRENTT

   echo
   echo "===================================="
   echo "Disk space utilization for $HOSTNAME"
   echo "===================================="
   df -h | head -n $LINES

   echo
   echo "===================================="
   echo "Uptime for $HOSTNAME"
   echo "===================================="
   uptime

   echo
   echo "===================================="
   echo "Important environment variables"
   echo "===================================="
   echo "PATH=$PATH"
   echo "USER=$USER"
   echo "HOME=$HOME"

   echo
   echo "===================================="
   echo "Last 5 logins"
   echo "===================================="
   last | head -n $LINES
}

mydc $1
