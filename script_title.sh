#!/bin/bash

echo "Starting the script to update title"

sed -i "s/<title>.*<\/title>/<title>$1<\/title>/g" index.html

docker-compose  up -d --build

echo "Succesfully updated title"
