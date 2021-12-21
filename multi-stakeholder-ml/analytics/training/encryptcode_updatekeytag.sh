#/bin/bash

# Encrypt python code
./encrypt_code.sh > encryption-log

# Update key tag for the security policy session
FSPF_KEY=`cat encryption-log|grep "fspf.pb AES-GCM tag:"|awk -F " key: " '{print $2}'|sed 's/[^a-zA-Z0-9]//g'`
FSPF_TAG=`cat encryption-log|grep "fspf.pb AES-GCM tag:"|awk -F " key: " '{print $1}'|awk -F "tag: " '{print $2}'| sed 's/[^a-zA-Z0-9]//g'`

echo "# file system protection details" > ../../policies/trainingowner/training_variables.sh
echo "export FSPF_KEY=\"$FSPF_KEY\"" >> ../../policies/trainingowner/training_variables.sh
echo "export FSPF_TAG=\"$FSPF_TAG\"" >> ../../policies/trainingowner/training_variables.sh
echo ""
echo "Updated the training code  owner's session file with the FSPF key and tag now"
