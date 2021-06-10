# maple-simulations-issue

To replicate issue:

```sh
git submodule update --init --recursive
cd lib/maple-core
./test.sh -t PoolClaimTest -r 1
```

This will run a successful test. To see issue behavior, go back to root and run `make simulation`

The issue is that in `lib/maple-core/contracts/test/TestUtil.sol`.

In the first round of tests we are running `PoolClaimTest`, which is in `lib/maple-core/contracts/core/pool/v1/test/PoolClaim.t.sol`.

On line 12 `setUpGlobals()` is called, which instantiates actors needed for testing. The issue is that in the context of maple-core, all of the actors are instantiated properly, but when run in the context of maple-simulations, not all are instantiated properly. To demonstrate this, `InheritTest` is run, which directly inherits PoolClaimTest from maple-core and runs the same tests. This is the same approach that we have been taking to run our maple-simulations, which contain private information about borrower terms etc, which is why it must exist in a separate private repo and import maple-core.

```
   └╴setUp()
      ├╴create Governor@0xCe71065D4017F316EC606Fe4422e11eB2c47c246 (lib/maple-core/contracts/test/TestUtil.sol:238)
      │  └╴← 55839 bytes of code
      ├╴create Governor@0x185a4dc360CE69bDCceE33b3784B0282f7961aea (lib/maple-core/contracts/test/TestUtil.sol:238)
      │  └╴← 55839 bytes of code
      ├╴create <unknown contract>@0xEFc56627233b02eA95bAE7e19F648d7DcD5Bb132 (lib/maple-core/contracts/test/TestUtil.sol:240)
      │  └╴← 0 bytes of code
      ├╴create <unknown contract>@0xf5a2fE45F4f1308502b1C136b9EF8af136141382 (lib/maple-core/contracts/test/TestUtil.sol:242)
```

It can be seen in the output that the `Governor` actor is created correctly, but the `SecurityAdmin` and `EmergencyAdmin` are not. These contracts are in the same directory: 

```js
import "./user/Governor.sol";
import "./user/SecurityAdmin.sol";
import "./user/EmergencyAdmin.sol";
```

Also SecurityAdmin and EmergencyAdmin can be found in the dapp.sol.json file.
