  
#!/bin/bash

echo "Starting the script to update body"

cat > index.html <<EOL
<!DOCTYPE html>
	<html lang="en">
	<head>
	<title>Page Title</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<style>
	body {
	  font-family: Arial, Helvetica, sans-serif;
	}
	</style>
	</head>
	<body>
	<p>Build Number ${BUILD_NUMBER}</p>
  <p>Job Name ${JOB_NAME}</p>
 
	</body>
	</html>
EOL

if [ "$(docker ps -q -f name=custom_nginx)" ]; then
  echo "Deleting existing container"
  docker rm -f custom_nginx
fi

docker-compose  up -d --build

echo "Succesfully updated body"
