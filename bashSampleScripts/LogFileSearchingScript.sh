#!/bin/bash

DIRS="dir1 dir2 dir3"

echo -n "Date (YYYYMMDD): "
read $date
echo -n "Log name (unique number): "
read $name
for D in $DIRS ; do
  LOG="/$D/usr/home/var/log/logfile-$date/$name.log"
  test -f "$LOG" && echo "Located file @ $LOG"
done 
