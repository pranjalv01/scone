#!/bin/bash

set -euo pipefail

source "${BASH_SOURCE%/*}/../common_variables.sh"
source "${BASH_SOURCE%/*}/training_variables.sh"

export SCONE_CLI_CONFIG="~/.cas/trainingowner-config.json"


# ================ Attest CAS ================

# attest CAS before uploading the session file, accept CAS running in debug
# mode (--only_for_testing-debug) and outdated TCB (-G)
echo "Attesting CAS ..."
scone cas attest -G --only_for_testing-debug --only_for_testing-ignore-signer "$CAS_ADDR" "$CAS_MRENCLAVE"


# ================ Session 2: Training ================

echo "Uploading policy session 2: Training ..."
scone session create --use-env "${BASH_SOURCE%/*}/templates/2_Training.yml"
echo ""
