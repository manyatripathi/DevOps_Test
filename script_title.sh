#!/bin/bash

echo "Starting the script to update title"

whoami

pwd
id -nG

docker ps


sed -i "s/<title>.*<\/title>/<title>$1<\/title>/g" index.html

docker-compose  up -d --build

echo "Succesfully updated title"
