#!/bin/bash

echo "Starting the script to update title"

sed -i "s/<title>.*<\/title>/<title>$1<\/title>/g" index.html

if [ "$(docker ps -q -f name=custom_nginx)" ]; then
  echo "Deleting existing container"
  docker rm -f custom_nginx
fi

docker-compose  up -d --build

echo "Succesfully updated title"
