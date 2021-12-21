#!/bin/bash

############### Preparing for demo ###############
# clean stage
sudo ./reset.sh

# build Docker images for demo
./build_images.sh

# stop all running Docker containers
docker stop `docker ps -aq` && docker rm `docker ps -aq`

################ Running demo ###############
# upload security policies to CAS
./upload_policies.sh

# run input app to encrypt input dataset and put encrypted to encrypted-input volume
docker-compose run input

# run training app over the encrypted-input and provide trained model into encrypted-output volume
docker-compose run training

# read trained model in the encrypted-ouput volume
docker-compose run output
