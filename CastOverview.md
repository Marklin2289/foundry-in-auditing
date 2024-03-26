# How to use Cast

To use `Cast`, run the cast command followed by a subcommand:

```
$ cast <subcommand>
```

# Examples

Let’s use cast to retrieve the total supply of the DAI token:

```
$ cast call 0x6b175474e89094c44da98b954eedeac495271d0f "totalSupply()(uint256)" --rpc-url https://eth-mainnet.alchemyapi.io/v2/Lc7oIGYeL_QvInzI0Wiu_pOZZDEKBrdf
3245167686810814481267213974 [3.245e27]
```

`cast` also provides many convenient subcommands, such as for decoding calldata:

```
$ cast 4byte-decode 0x1F1F897F676d00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000003e7
```

```
1. "fulfillRandomness(bytes32,uint256)"
0x676d000000000000000000000000000000000000000000000000000000000000
999
```

You can also use `cast` to send arbitrary messages. Here’s an example of sending a message between two Anvil accounts.

```
$ cast send --private-key <Your Private Key> 0x3c44cdddb6a900fa2b585dd299e03d12fa4293bc $(cast from-utf8 "hello world") --rpc-url http://127.0.0.1:8545/
```
