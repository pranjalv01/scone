#!/bin/bash

set -e

echo "Building the base image that contains the SCONE CLI and python with all necessary dependencies."
echo "This is necessary to protect the python dependencies against malicious code injections."
docker build . -t scone-tensorflow:base -f Dockerfile.base
echo ""

echo "Now, we enter the base image to record the trusted state of the python"
echo "dependencies and encrypt the application."
docker run -it --rm -e SCONE_MODE=sim -v `pwd`:/train scone-tensorflow:base -c "
    cd /train && \
    # cleanup previous files
    rm -rf image_files && \
    mkdir -p image_files/app && \
    cd image_files && \
    scone fspf create fspf.pb && \
    scone fspf addr fspf.pb / --not-protected --kernel / && \
    scone fspf addr fspf.pb /usr/lib/ --authenticated --kernel /usr/lib && \
    scone fspf addf fspf.pb /usr/lib/ /usr/lib/ && \
    # all files in /app shall be encrypted
    scone fspf addr fspf.pb /app --encrypted --kernel /app && \
    # encrypt the files in /train/app (the plaintext) and write the encrypted
    # files to /train/image_files/app
    scone fspf addf fspf.pb /app /train/app /train/image_files/app
    # encrypt the metadata file
    scone fspf encrypt fspf.pb
"

echo ""
echo "Update the training code owner's session file with the FSPF key and tag now"



