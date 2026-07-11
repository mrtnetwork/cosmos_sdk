// ignore_for_file: unused_local_variable

import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:example/clinet/grpc_client_example.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/bank/v1beta1/models.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/node/v1beta1/src/query.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/base/v1beta1/src/coin.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/signing/v1beta1/src/signing.dart';
import 'package:cosmos_sdk/proto_messages/cosmos/tx/v1beta1/models.dart';

void main() async {
  final provider = getClient(
      rpcUrl: "http://localhost:26657",
      resutlUrl: "http://localhost:1317",
      grpcUrl: "localhost",
      grpcPort: 9090);
  final client = ExampleComsoClient(
      provider: provider, supportedApis: CosmosProviderApi.cosmosApis);
  final signer = account();
  final sigerAddr = signer.toPublicKey().toAddress(hrp: CosmosAddrConst.accHRP);
  final destination = destinationAccount();
  final tx = await createTx(
      from: sigerAddr,
      signer: signer,
      coin: const Coin(denom: "stake", amount: "5000000"),
      destination: destination.address,
      client: client);
  final txId = await client.broadcastTransaction(tx.toBuffer());
}

CosmosSecp256K1PrivateKey account() {
  Bip44 key = hdKey();
  key = key.deriveDefaultPath;
  return CosmosSecp256K1PrivateKey.fromBytes(key.privateKey.raw);
}

Bip44 hdKey() {
  const String mnemonic =
      "stay account section seat resist vital jazz mosquito kiwi shoot present tornado trick stomach satisfy science skin rhythm squeeze athlete universe staff mom usage";
  final seed = Bip39SeedGenerator(Mnemonic.fromString(mnemonic)).generate();
  return Bip44.fromSeed(seed, Bip44Coins.cosmos);
}

CosmosBaseAddress destinationAccount(
    {int index = 100, String hrp = CosmosAddrConst.accHRP}) {
  Bip44 key = hdKey();
  key = key.purpose.coin
      .account(0)
      .change(Bip44Changes.chainExt)
      .addressIndex(index);
  return CosmosSecp256K1PrivateKey.fromBytes(key.privateKey.raw)
      .toPublicKey()
      .toAddress(hrp: hrp);
}

Future<AuthInfo> createAuth(
    {required CosmosBaseAddress from,
    required CosmosPublicKey pubKey,
    required Coin coin,
    required ExampleComsoClient client,
    SignMode signMode = SignMode.signModeDirect,
    int? fee,
    int? gasUsed,
    BigInt? sq}) async {
  final accountInfo = await client.getAccount(from);
  return AuthInfo(
      signerInfos: [
        SignerInfo(
            publicKey: pubKey.toAny(),
            modeInfo: ModeInfo(single: ModeInfoSingle(mode: signMode)),
            sequence: (accountInfo.sequence! + (sq ?? BigInt.zero)))
      ],
      fee: Fee(amount: [
        Coin(
          denom: coin.denom,
          amount: "${fee ?? 1000}",
        )
      ], gasLimit: BigInt.from(gasUsed ?? 200000)));
}

Future<AuthInfo> calculateFee(
    {required List<CosmosProtoMessage> messages,
    required AuthInfo authInfo,
    required ExampleComsoClient client}) async {
  /// Creating transaction body with the message
  final txbody = TxBody(messages: messages.map((e) => e.toAny()).toList());
  final simulate = await client.simulateTx(
      Tx(body: txbody, authInfo: authInfo, signatures: [List.filled(65, 0)])
          .toBuffer());
  final gasUsed =
      BigRational(simulate.gasInfo!.gasUsed ?? BigInt.from(200000)) *
          BigRational.parseDecimal("1.4");
  final config = await getConfig(client);
  final minGas = gasPrice(config.minimumGasPrice!
      .replaceAll(authInfo.fee!.amount.first.denom!, ""));
  final fee = (gasUsed * minGas).ceil().toBigInt().toIntOrThrow;
  return AuthInfo(
      signerInfos: authInfo.signerInfos,
      fee: Fee(gasLimit: gasUsed.toBigInt(), amount: [
        Coin(denom: authInfo.fee!.amount.first.denom, amount: "$fee")
      ]));
}

Future<ConfigResponse> getConfig(ExampleComsoClient client) async {
  return await client.query(const ConfigRequest());
}

BigRational gasPrice(String low, {int decimals = 6}) {
  final networkDecimals = BigRational(BigInt.from(10).pow(decimals));
  return (BigRational.parseDecimal(low) * networkDecimals);
}

Future<TxRaw> createTx(
    {required CosmosBaseAddress from,
    required String destination,
    required CosmosPrivateKey signer,
    required Coin coin,
    required ExampleComsoClient client,
    String memo = "https://github.com/mrtnetwork/cosmos_sdk"}) async {
  final accountInfo = await client.getAccount(from);
  final chainId = await client.chainId();
  final pubKey = signer.toPublicKey();
  AuthInfo authInfo =
      await createAuth(from: from, pubKey: pubKey, coin: coin, client: client);
  final message = MsgSend(
      fromAddress: from.address,
      toAddress: destination,
      amount: [Coin(denom: coin.denom, amount: "1000000")]);
  authInfo = await calculateFee(
      messages: [message], authInfo: authInfo, client: client);
  final txbody = TxBody(messages: [message.toAny()], memo: memo);
  final SignDoc signDoc = SignDoc(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      chainId: chainId,
      accountNumber: accountInfo.accountNumber);

  final sign = signer.sign(signDoc.toBuffer());

  return TxRaw(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      signatures: [sign]);
}

Future<TxRaw> createAminoTx(
    {required CosmosBaseAddress from,
    required String destination,
    required CosmosPrivateKey signer,
    required Coin coin,
    required ExampleComsoClient client,
    String memo = "https://github.com/mrtnetwork/cosmos_sdk"}) async {
  final accountInfo = await client.getAccount(from);
  final chainId = await client.chainId();
  final pubKey = signer.toPublicKey();
  AuthInfo authInfo = await createAuth(
    from: from,
    pubKey: pubKey,
    coin: coin,
    signMode: SignMode.signModeLegacyAminoJson,
    client: client,
  );
  final message = MsgSend(
      fromAddress: from.address,
      toAddress: destination,
      amount: [Coin(denom: coin.denom, amount: "1000000")]);
  authInfo = await calculateFee(
      messages: [message], authInfo: authInfo, client: client);
  final aminoTx = AminoTx(
    messages: [message],
    accountNumber: accountInfo.accountNumber ?? BigInt.zero,
    chainId: chainId,
    config: CosmosDefaultBech32Configs.cosmosHub,
    fee: AminoFee(
        amount: authInfo.fee!.amount,
        gas: authInfo.fee!.gasLimit,
        granter: authInfo.fee!.granter,
        payer: authInfo.fee!.payer),
    sequence: accountInfo.sequence!,
  );
  final sign = signer.sign(aminoTx.toBuffer());
  final txbody = TxBody(messages: [message.toAny()], memo: memo);

  return TxRaw(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      signatures: [sign]);
}
