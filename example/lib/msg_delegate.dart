import 'package:blockchain_utils/bip/mnemonic/mnemonic.dart';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';

import 'provider.dart';

void main() async {
  final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
          "this dove indoor skin shed gap east welcome gift buffalo silent high"))
      .generate();

  final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.cosmos).deriveDefaultPath;
  final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);
  final pubkey = CosmosSecp256K1PublicKey.fromBytes(bip44.publicKey.compressed);
  final provider = TendermintProvider(TendermintHTTPProvider(
      url: "https://rpc.sentry-02.theta-testnet.polypore.xyz"));

  final accountInfo = await provider.request(TendermintRequestAbciQuery(
      request: QueryAccountInfoRequest(pubkey.toAddresss())));
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));

  final valAddr =
      BaseAddress("cosmosvaloper10v6wvdenee8r9l6wlsphcgur2ltl8ztkfrvj9a");
  final validator = MsgDelegate(
      validatorAddress: valAddr,
      delegatorAddress: pubkey.toAddresss(),
      amount: Coin(
        denom: "uatom",
        amount: BigInt.from(100000),
      ));

  final authInfo = AuthInfo(
    signerInfos: [
      SignerInfo(
          publicKey: pubkey,
          modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
          sequence: accountInfo.info.sequence),
    ],
    fee: Fee(
        payer: pubkey.toAddresss(),
        amount: [
          Coin(
            denom: "uatom",
            amount: BigInt.from(1000),
          )
        ],
        gasLimit: BigInt.from(200000)),
  );
  final txbody = TXBody(messages: [validator]);
  final SignDoc signDoc = SignDoc(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      chainId: latestBlock.sdkBlock!.header.chainId!,
      accountNumber: accountInfo.info.accountNumber);
  final sign2 = privateKey.sign(signDoc.toBuffer());
  final txRaw = TxRaw(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      signatures: [sign2]);

  await provider.request(TendermintRequestBroadcastTxCommit(
      BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));

  /// https://explorer.polypore.xyz/theta-testnet-001/tx/B56AADD1698C0BCA40513B6A92242FDBF633BC06923489218BA0B98F94D17303
}
