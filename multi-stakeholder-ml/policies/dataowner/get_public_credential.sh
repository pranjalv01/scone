#!/bin/bash

export SCONE_CLI_CONFIG="~/.cas/dataowner-config.json"

#Public Key Hash: 3giGD5tqjHaxB3xELKGK8Eee2ny8v3zddfcjaMBLDTrygn4x4X
/opt/scone/bin/rust-cli self show|awk -F "Public Key Hash: " '{print $2}'
