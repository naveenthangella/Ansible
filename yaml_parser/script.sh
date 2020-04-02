#!/bin/bash

if [ ! -f "$1" ]; then
  echo "Given file does not exist"
  exit 1
fi

COURSES_COUNT=$(cat sample.yml | yq . | jq '.courses[].name' | wc -l)

while [ $COURSES_COUNT -gt 0 ]; do

echo -e "Hello, I'm NAME from PLACE. My date of birth is DATE. List of course COURSES"

done