#!/bin/bash

set -euo pipefail

cd "${BASH_SOURCE%/*}"

DATAOWNER_CREDENTIAL=$(./dataowner/get_public_credential.sh)
export DATAOWNER_CREDENTIAL
echo "Data owner credential is: $DATAOWNER_CREDENTIAL"

echo "Uploading training owner policy sessions ..."
./trainingowner/upload_policies.sh  # This requires DATAOWNER_CREDENTIAL to give read access to the data owner

echo "Uploading data owner policy sessions ..."
./dataowner/upload_policies.sh  # This requires the training policy session to be present and given read access (in order to verify it)

echo "Uploading output owner policy sessions ..."
./outputowner/upload_policies.sh
