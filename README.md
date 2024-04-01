# Dart Cosmos-sdk

Experience effortless interaction with a Cosmos SDK-based network in Dart, facilitating the seamless creation, signing, and transmission of transactions. (Beta version)
This version is in beta and requires comprehensive testing for each model implementation.

## Supported Protocol Buffer packages:"

- cosmos.auth.v1beta1
- cosmos.authz.v1beta1
- cosmos.bank.v1beta1
- cosmos.base.abci.v1beta1
- cosmos.base.node.v1beta1
- cosmos.base.query.v1beta1
- cosmos.base.reflection.v1beta1
- cosmos.base.tendermint.v1beta1
- cosmos.base.v1beta1
- cosmos.crisis.v1beta1
- cosmos.crypto.ed25519
- cosmos.crypto.multisig.v1beta1
- cosmos.crypto.secp256k1
- cosmos.crypto.secp256r1
- cosmos.distribution.v1beta1
- cosmos.feegrant.v1beta1
- cosmos.genutil.v1beta1
- cosmos.gov.v1beta1
- cosmos.mint.v1beta1
- cosmos.nft.v1beta1
- cosmos.params.v1beta1
- cosmos.slashing.v1beta1
- cosmos.staking.v1beta1
- cosmos.tx.signing.v1beta1
- cosmos.tx.v1beta1
- cosmos.upgrade.module.v1
- cosmos.upgrade.v1beta1
- cosmos.vesting.v1beta1
- cosmos.ics23.v1
- capability.v1
- ibc.applications.fee.v1
- ibc.applications.interchain_accounts.controller.v1
- ibc.applications.interchain_accounts.genesis.v1
- ibc.applications.interchain_accounts.host.v1
- ibc.applications.interchain_accounts.v1
- ibc.applications.transfer.v1
- ibc.applications.transfer.v2
- ibc.core.channel.v1
- ibc.core.client.v1
- ibc.core.commitment.v1
- ibc.core.connection.v1
- ibc.core.types.v1
- ibc.lightclients.localhost.v2
- ibc.lightclients.solomachine.v2
- ibc.lightclients.solomachine.v3
- ibc.lightclients.tendermint.v1
- ibc.lightclients.wasm.v1
- tendermint/tendermint

## Example

### Transaction

 Create and sign transactions related to the Cosmos Hub.

```dart

final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
          "this dove indoor skin shed gap east welcome gift buffalo silent high"))
      .generate();
  final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.cosmos).deriveDefaultPath;
  final pubkey = CosmosSecp256K1PublicKey.fromBytes(bip44.publicKey.compressed);
  final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);
  final provider = TendermintProvider(TendermintHTTPProvider(
      url: "https://rpc.sentry-02.theta-testnet.polypore.xyz"));
  final accountInfo = await provider.request(TendermintRequestAbciQuery(
      request: QueryAccountInfoRequest(pubkey.toAddresss())));
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));
  final authInfo = AuthInfo(
      signerInfos: [
        SignerInfo(
            publicKey: pubkey,
            modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
            sequence: accountInfo.info.sequence)
      ],
      fee: Fee(amount: [
        Coin(
          denom: "uatom",
          amount: BigInt.from(1000),
        )
      ], gasLimit: BigInt.from(200000)));
  final message = MsgSend(
      fromAddress: pubkey.toAddresss(),
      toAddress: BaseAddress("cosmos1qhslf0sx2fegltfqq0p5j6etmdznjgfnm2j6nc"),
      amount: [Coin(denom: "uatom", amount: BigInt.from(1000000))]);
  final txbody = TXBody(messages: [message]);
  final SignDoc signDoc = SignDoc(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      chainId: latestBlock.block!.header.chainId!,
      accountNumber: accountInfo.info.accountNumber);
  final sign = privateKey.sign(signDoc.toBuffer());
  final txRaw = TxRaw(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      signatures: [sign]);
  await provider.request(TendermintRequestBroadcastTxCommit(
      BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));

 ```

### Address and key managment
  
  Support for Secp256k1, ED25519 and NIST P-256 keys.

```dart

  /// Generate seed bytes from a mnemonic
  final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
          "this dove indoor skin shed gap east welcome gift buffalo silent high"))on
      .generate();

  /// Derive BIP44 path
  final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.cosmos).deriveDefaultPath;

  /// Create a Cosmos Secp256k1 private key from the derived private key bytes
  final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);

  /// Generate the corresponding public key and address for Secp256k1
  final pubkey = CosmosSecp256K1PublicKey.fromBytes(bip44.publicKey.compressed);
  final cosmosAddress = pubkey.toAddresss(hrp: "cosmos");

  /// Sign the provided digest using the Secp256k1 private key
  final sign = privateKey.sign(digest);

  /// Create a Cosmos ED25519 private key from the provided key bytes
  final ed25519PrivateKey = CosmosED25519PrivateKey.fromBytes(keyBytes);

  /// Generate the corresponding public key and address for ED25519
  final edPublicKey = ed25519PrivateKey.toPublicKey();
  final validatorAddr = edPublicKey.toAddresss(hrp: "cosmosvaloper");

  /// Sign the provided digest using the ED25519 private key
  final edSign = ed25519PrivateKey.sign(digest);

  /// Create a Cosmos NIST P-256 private key from the provided key bytes
  final nistPrivateKey = CosmosNist256p1PrivateKey.fromBytes(keyBytes);

  /// Generate the corresponding public key and base address for NIST P-256
  final nistPublicKey = nistPrivateKey.toPublicKey();
  final baseAddress = nistPublicKey.toAddresss();

  /// Sign the provided digest using the NIST P-256 private key
  final nistSign = nistPrivateKey.sign(digest);

  ```

### JSON-RPC

  Support Tendermint RPC.

```dart

  /// Define a Tendermint provider with a HTTP URL
  final provider = TendermintProvider(TendermintHTTPProvider(
      url: "https://rpc.sentry-02.theta-testnet.polypore.xyz"));

  /// Query account information using the provider
  final accountInfo = await provider.request(TendermintRequestAbciQuery(
      request: QueryAccountInfoRequest(pubkey.toAddresss())));

  /// Get the latest block information using the provider
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));

  /// Broadcast a transaction and wait for a commit using the provider
  final transaction = await provider.request(TendermintRequestBroadcastTxCommit(
      BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));

```

## Contributing

Contributions are welcome! Please follow these guidelines:

- Fork the repository and create a new branch.
- Make your changes and ensure tests pass.
- Submit a pull request with a detailed description of your changes.

## Feature requests and bugs

Please file feature requests and bugs in the issue tracker.
