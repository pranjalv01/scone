#!/bin/bash

set -e

echo ""
echo "Building images..."

# First, pull images
#docker-compose pull

# Next, the encrypted train image needs a prepared base image.
# This has to be built locally, as pulled images cannot be trusted.
pushd analytics/training > /dev/null
docker build . -t scone-tensorflow:base -f Dockerfile.base
popd > /dev/null

pushd analytics/output > /dev/null
docker build . -t scone-inference:base -f Dockerfile.base
popd > /dev/null

# Finally, build all remaining images
docker-compose build

echo ""
echo "Done, images built."
