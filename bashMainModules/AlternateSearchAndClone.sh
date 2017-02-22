#!/bin/bash

echo 'Enter the name of the subject:'
read sub
echo 'Enter the name of the topic:'
read topic

if [ -d "$sub" ]; then
  cd "$sub"
  git fetch origin && git pull --all
  git checkout $topic
else
  git clone 'git@csgrad06.nwmissouri.edu:S525729/Lalit-cli-test.git'$sub'.git' -b $topic
  cd "$sub"
fi

echo '#########'
echo 'Current repository (subject): '$topic
echo 'Current branch (topic): '
git branch | grep '*'