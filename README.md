## Foundry

**Foundry is a blazing fast, portable and modular toolkit for Ethereum application development written in Rust.**

Foundry consists of:

-   **Forge**: Ethereum testing framework (like Truffle, Hardhat and DappTools).
-   **Cast**: Swiss army knife for interacting with EVM smart contracts, sending transactions and getting chain data.
-   **Anvil**: Local Ethereum node, akin to Ganache, Hardhat Network.
-   **Chisel**: Fast, utilitarian, and verbose solidity REPL.

## Documentation

https://book.getfoundry.sh/

## Usage

### Build

```shell
$ forge build
```

### Test

```shell
$ forge test
```

### Format

```shell
$ forge fmt
```

### Gas Snapshots

```shell
$ forge snapshot
```

### Anvil

```shell
$ anvil
```

### Deploy

```shell
$ forge script script/Counter.s.sol:CounterScript --rpc-url <your_rpc_url> --private-key <your_private_key>
```

### Cast

```shell
$ cast <subcommand>
```

### Help

```shell
$ forge --help
$ anvil --help
$ cast --help
```
forge verify-contract "0xb8A821826A4fD4cFa461F8361C2dC6b8dc4F7C52" "StorageVsMemory" --chain 97 --etherscan-api-key "I4PGES52I2RQAYssXTU8A13MGZB277W3RHDC"
forge create --rpc-url "https://bsc-testnet.drpc.org" --private-key "0x9845543a0bed72aef534c4c953457baf32f67a968a70a95e407a2a4c6b791ec5" script/StorageVsMemory.sol:StorageVsMemory --broadcast