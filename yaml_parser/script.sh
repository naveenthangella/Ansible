#!/bin/bash

if [ ! -f "$1" ]; then
  echo "Given file does not exist"
  exit 1
fi
i=0
COURSES_COUNT=$(cat sample.yml | yq . | jq '.courses[].name' | wc -l)
NAME=$(cat sample.yml | yq . | jq .name)
PLACE=$(cat sample.yml | yq . | jq .place)
DATE=$(cat sample.yml | yq . | jq .date)
# shellcheck disable=SC2091
COURSES=(`cat sample.yml | yq . | jq '.courses[].name'`)

while [ $COURSES_COUNT -gt 0 ]; do

  echo -e "Hello, Im $NAME from $PLACE. My date of birth is $DATE. Im learning ${COURSES[$i]}  "
  COURSES_COUNT=$(($COURSES_COUNT-1))

  i=$(($i+1))

done