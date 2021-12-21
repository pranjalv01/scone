#!/bin/bash

set -euo pipefail

source "${BASH_SOURCE%/*}/../common_variables.sh"
source "${BASH_SOURCE%/*}/output_variables.sh"

export SCONE_CLI_CONFIG="~/.cas/outputowner-config.json"


# ================ Attest CAS ================

# attest CAS before uploading the session file, accept CAS running in debug
# mode (--only_for_testing-debug) and outdated TCB (-G)
echo "Attesting CAS ..."
scone cas attest -G --only_for_testing-debug --only_for_testing-ignore-signer "$CAS_ADDR" "$CAS_MRENCLAVE"


# ================ Session 3: Output ================

echo "Uploading policy session 3: training_output ..."
scone session create --use-env "${BASH_SOURCE%/*}/templates/3_Output.yml"
echo ""
