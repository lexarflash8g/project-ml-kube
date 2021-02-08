#!/usr/bin/env bash

## Complete the following steps to get Docker running locally

# Step 1:
# Build image and add a descriptive tag
docker build --tag flaskapp . 

# Step 2: 
# List docker images

docker images ls

# Step 3: 
# Run flask app

docker run -d -p 8000:80 flaskapp > container.id
$(!!)
 docker logs --until=2s -t `cat container.id` >& docker_output.txt