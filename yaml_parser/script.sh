#!/bin/bash

if [ ! -f "$1" ]; then
  echo "Given file does not exist"
  exit 1
fi

echo -e "Hello, I'm NAME from PLACE. My date of birth is DATE. List of course COURSES"