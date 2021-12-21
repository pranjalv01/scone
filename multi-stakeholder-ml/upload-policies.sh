#!/bin/bash

set -e

echo ""
echo "Uploading policy sessions ..."
docker-compose run prepare_policies

echo ""
echo "Policy upload completed."
