Ini adalah edisi pertama dari seri belajar blockchain yang nantinya akan saya update berkala.

### 1. Install foundry

Foundry merupakan toolchain untuk ethereum yang ringan dan cepat, dengan penulisan smart contract dan test codenya menggunakan bahasa solidity.
Foundry menggunakan bahasa rust sebagai compilernya jadi pastikan install rust terlebih dahulu. untuk details installasi bisa dibaca disini <https://book.getfoundry.sh/getting-started/installation>

### 2. inisiasi project

untuk membuat project baru dengan foundry bisa ketik ini di terminal :

```bash
forge init hello_foundry
```

setelah init akan ada folder hello_foundry dengan list folder berikut

### 📦 Struktur Recommended Foundry

```bash
.
├── src/                  # 🧠 Smart contracts utama
│   └── MyToken.sol       # ✅ Di sini tempat MyToken.sol
├── script/               # 📜 Script untuk deploy atau call contract
│   └── Deploy.s.sol      # Contoh deploy script
├── test/                 # 🧪 File-file test
│   └── MyToken.t.sol     # Unit test untuk MyToken
├── lib/                  # 📦 Dependency (ex: openzeppelin-contracts)
├── foundry.toml          # ⚙️ Konfigurasi project
```

### 3. Buat Smart Contract erc20

Kita akan menggunakan OpenZeppelin ERC20 untuk membuat tokenya, kita bisa menginstall dependensinya dengan cara:

```bash
forge install OpenZeppelin/openzeppelin-contracts
```

buat file dengan lokasi  `src/LinkedinToken.sol`, dan tulis smart contractnya

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract LinkedinToken is ERC20 {
    constructor() ERC20("Linkedin", "LNK") {
        _mint(msg.sender, 1000000* 10 ** decimals());
    }
}
```

code diatas mengindikasikan bahwa kita akan membuat token dengan nama Linkedin, simbol LNK, dan supply 1.000.000 .

### 4. compile dan test

sebelum melakukan build kita harus menambahkan library openzeppelin di file * `foundry.toml`

```toml
remappings = ["@openzeppelin-contracts=lib/openzeppelin-contracfts"]
```

untuk melakukan build/compile bisa diketik command :

```bash
  forge build
```

* Tes , bisa gunakan:

dan untuk melakukan testing kita akan membuat file  di `test/LinkedinToken.t.sol`

```solidity
// SPDX-License-Identifier: UNLICENSED
// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../src/LinkedinToken.sol";

contract LinkedinTokenTest is Test {
    LinkedinToken token;

    function setUp() public {
        token = new LinkedinToken();
    }

    function testName() public view {
        assertEq(token.name(), "Linkedin");
    }

    function testTotalSupply() public view {
        uint256 expectedSupply = 1000000 * 10 ** token.decimals();
        assertEq(token.totalSupply(), expectedSupply);
    }

    function testInitialBalance() public view {
        uint256 expectedBalance = 1000000 * 10 ** token.decimals();
        assertEq(token.balanceOf(address(this)), expectedBalance);
    }
}
```

untuk melakuakan test kita menggunakan command ini :

```bash
forge test
```

jika tidak ada kendala kita akan mendapatkan hasil seperti ini

```

[⠊] Compiling...
No files changed, compilation skipped

Ran 3 tests for test/LinkedinToken.sol:MyTokenTest
[PASS] testInitialBalance() (gas: 13287)
[PASS] testName() (gas: 13262)
[PASS] testTotalSupply() (gas: 12738)
Suite result: ok. 3 passed; 0 failed; 0 skipped; finished in 524.76µs (305.64µs CPU time)

Ran 1 test suite in 4.92ms (524.76µs CPU time): 3 tests passed, 0 failed, 0 skipped (3 total tests)
```

### 5. Deploy Token

sebelum melakukan deploy kita akan membuat file .env dimana ini akan berisi `PRIVATE_KEY` dari address deployer.
kemudian buat file `script/Deploy.s.sol`

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Script.sol";
import "../src/LinkedinToken.sol";

contract Deploy is Script {
    function run() external {
        // Load private key from env (or hardcoded for dev only, not recommended)
        uint256 deployerPrivateKey = vm.envUint("PRIVATE_KEY");

        // Start broadcasting transaction
        vm.startBroadcast(deployerPrivateKey);

        // Deploy the token
        new LinkedinToken();

        // Stop broadcasting
        vm.stopBroadcast();
    }
}

```

sekarang kita bisa melakukan deploy token menggunakan command

```bash
forge script script/Deploy.s.sol --rpc-url https://ethereum-sepolia-rpc.publicnode.com --broadcast --verify -vvvv
```

Dengan step 1 ini kita sudah membuat dan meng-deploy token ERC20 menggunakan Foundry. Untuk edisi berikutnya, kita akan membuat smart contract untuk NFT (ERC-712), STO (EIP-1400,EIP-1410), dll. 