#!/bin/bash

# Check if a URL is provided as an argument
if [ $# -ne 1 ]; then
  echo "Please provide a URL as an argument"
  exit 1
fi

url=$1

# Send GET request and store the response in a variable
response=$(curl -s -w "%{http_code}" $url)

# Extract the status code from the response
status_code=$(echo "$response" | tail -n 1)

# Check if the status code is 200 (OK)
if [ $status_code -eq 200 ]; then
  # Extract and display the body of the response
  body=$(echo "$response" | sed '$ d')
  echo "$body"
else
  echo "Error: Request failed with status code $status_code"
fi

