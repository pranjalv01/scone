#!/bin/bash

set -euo pipefail
# Define policy names, used in templates
export INPUT_POLICY_NAME="input_policy"
export TRAINING_POLICY_NAME="training_policy"
export OUTPUT_POLICY_NAME="output_policy"

# Define enclave measurements for the different components
# TODO these must be updated!
# The MRENCLAVEs can be queried by running the command from the comments below from within the appropriate container
#export CAS_MRENCLAVE="cc54413bc383915f3eb4bc277cd06e2d17c8aa637cbd2722cc991fa9e7c993e3" # docker-compose run -eSCONE_HASH=1 cas
export CAS_MRENCLAVE="ffa14158277f97ac4d681f844fb641acc1396873ddca3418c93b5fabc6124752" # docker-compose run -eSCONE_VERSION=1 cas
export MRENCLAVE_INPUT="b9a29b2500be81971778aa940ff86dc4b7cd6a8bfc5bbbab94de9f2f7caa7612" # docker-compose run -eSCONE_HASH=1 input
export MRENCLAVE_TRAINING="c3f9c93d9109ce59f4609f9bed8f0c65dd6ac4d79901f0608a56a453e813d29d" # docker-compose run -eSCONE_HASH=1 training
export MRENCLAVE_OUTPUT="4c97cd4c52238ee1fe865924aff461a0b22444952a952d36a9fd7715513571a8" # docker-compose run -eSCONE_HASH=1 output

# Define shared variables
export CAS_ADDR=cas

