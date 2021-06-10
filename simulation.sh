#!/usr/bin/env bash
set -e

[[ $SKIP_MAINNET_CHECK || "$ETH_RPC_URL" && "$(seth chain)" == "ethlive" ]] || { echo "Please set a mainnet ETH_RPC_URL"; exit 1; }

export DAPP_TEST_TIMESTAMP=1622483493
export DAPP_TEST_NUMBER=12543537
export DAPP_SOLC_VERSION=0.6.11
export DAPP_SRC="contracts"
# export DAPP_SKIP_BUILD=0
export DAPP_LINK_TEST_LIBRARIES=0
export DAPP_REMAPPINGS=$(cat remappings.txt)
export DAPP_LIBRARIES=" ../lib/maple-core/contracts/libraries/loan/v1/LoanLib.sol:LoanLib:0x51A189ccD2eB5e1168DdcA7e59F7c8f39AA52232 ../lib/maple-core/contracts/libraries/pool/v1/PoolLib.sol:PoolLib:0x2c1C30fb8cC313Ef3cfd2E2bBf2da88AdD902C30 ../lib/maple-core/contracts/libraries/util/v1/Util.sol:Util:0x95f9676A34aF2675B63948dDba8F8c798741A52a"

# ./build.sh

export OUT_PATH="./simulation-output"

LANG=C.UTF-8 dapp test --match InheritTest --rpc-url "$ETH_RPC_URL" --verbosity 2 
# LANG=C.UTF-8 dapp test --match test_blank --rpc-url "$ETH_RPC_URL" --verbosity 2 
# LANG=C.UTF-8 dapp test --match LaunchSimulation --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" --fuzz-runs 1

# LANG=C.UTF-8 dapp test --match test_happy_path                    --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_1_happy_path.txt"
# LANG=C.UTF-8 dapp test --match test_late_fee_fbg_loan_one_payment --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_2_late_fee_fbg_loan_one_payment.txt"
# LANG=C.UTF-8 dapp test --match test_default_unsecured_loan        --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_3_default_unsecured_loan.txt"
# LANG=C.UTF-8 dapp test --match test_default_secured_loan          --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_4_default_secured_loan.txt"
# LANG=C.UTF-8 dapp test --match test_default_two_loans             --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_5_default_two_loans.txt"
# LANG=C.UTF-8 dapp test --match test_default_two_loans             --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_6_default_two_loans.txt"
# LANG=C.UTF-8 dapp test --match test_default_three_loans           --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_7_default_three_loans.txt"
# LANG=C.UTF-8 dapp test --match test_default_four_loans            --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_8_default_four_loans.txt"
# LANG=C.UTF-8 dapp test --match test_default_five_loans            --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_9_default_five_loans.txt"
# LANG=C.UTF-8 dapp test --match test_default_six_loans             --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_10_default_six_loans.txt"
# LANG=C.UTF-8 dapp test --match test_default_seven_loans           --rpc-url "$ETH_RPC_URL" --verbosity 2 --cache "cache/dapp-cache" > "$OUT_PATH/test_11_default_seven_loans.txt"
