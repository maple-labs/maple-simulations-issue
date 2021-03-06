#!/usr/bin/env bash
set -e

export DAPP_TEST_TIMESTAMP=1622483493
export DAPP_TEST_NUMBER=12543537
export DAPP_SOLC_VERSION=0.6.11
export DAPP_SRC="contracts"
export DAPP_BUILD_OPTIMIZE=0
export DAPP_LINK_TEST_LIBRARIES=1
# export DAPP_STANDARD_JSON="config.json"
export DAPP_REMAPPINGS=$(cat remappings.txt)
# export DAPP_LIBRARIES=" ../lib/maple-core/contracts/libraries/loan/v1/LoanLib.sol:LoanLib:0x51A189ccD2eB5e1168DdcA7e59F7c8f39AA52232 ../lib/maple-core/contracts/libraries/pool/v1/PoolLib.sol:PoolLib:0x2c1C30fb8cC313Ef3cfd2E2bBf2da88AdD902C30 ../lib/maple-core/contracts/libraries/util/v1/Util.sol:Util:0x95f9676A34aF2675B63948dDba8F8c798741A52a"

dapp --use solc:0.6.11 build
