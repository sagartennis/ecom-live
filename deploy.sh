#!/bin/bash

set -f
string=$AWS_IP
array=(${string//,/ })


for i in "${!array[@]}"; do
  echo "Deploy on EC2"
  echo "Deploy django app on to the server ${array[i]}"
  ssh ubuntu@${array[i]}  "cd ecomm-live && git pull origin main && sudo docker-compose build && docker-compose up"
done