import 'package:blockchain_utils/utils/utils.dart';
import 'package:blockchain_utils/bip/bip/bip39/bip39_seed_generator.dart';
import 'package:blockchain_utils/bip/bip/bip44/bip44_base.dart';
import 'package:blockchain_utils/bip/bip/conf/bip44/bip44_coins.dart';
import 'package:blockchain_utils/bip/mnemonic/mnemonic.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';

import 'provider.dart';

///
void main() async {
  final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
          "this dove indoor skin shed gap east welcome gift buffalo silent high"))
      .generate();
  final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.cosmos).deriveDefaultPath;
  final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);
  final pubkey = CosmosSecp256K1PublicKey.fromBytes(bip44.publicKey.compressed);
  final provider = TendermintProvider(
      TendermintHTTPProvider(url: "http://54.243.15.123:27147/"));
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));
  final accountQuery = await provider.request(TendermintRequestAbciQuery(
      request: QueryAccountRequest(pubkey.toAddress(hrp: "smaya"))));
  final BaseAccount account = accountQuery.account as BaseAccount;
  final message = ThorchainMsgSend(
      fromAddress: pubkey.toAddress(hrp: "smaya"),
      toAddress:
          CosmosBaseAddress("smaya1wqzpmju4gl0kcajhjls6ufrqecaedxm9xlrkv4"),
      amount: [
        Coin(denom: "cacao", amount: BigInt.from(500000000000)),
      ]);
  // /// Creating authentication info for transaction
  final authInfo = AuthInfo(
      signerInfos: [
        SignerInfo(
            publicKey: pubkey.toAny(),
            modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
            sequence: account.sequence)
      ],
      fee: Fee(amount: [
        Coin(
          denom: "cacao",
          amount: BigInt.from(1000000000),
        )
      ], gasLimit: BigInt.from(200000)));

  /// Creating transaction body with the message
  final txbody = TXBody(messages: [message]);

  /// Creating a signable document for the transaction
  final SignDoc signDoc = SignDoc(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      chainId: latestBlock.block!.header.chainId,
      accountNumber: account.accountNumber);
  final sign = privateKey.sign(signDoc.toBuffer());

  // /// Signing the document with the private key

  // /// Creating a raw transaction with body, authentication info, and signature
  final txRaw = TxRaw(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      signatures: [sign]);

  // /// Broadcasting the raw transaction to the network
  await provider.request(TendermintRequestBroadcastTxCommit(
      BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));

  /// https://stagenet.mayascan.org/tx/1562E8D03B93E8AADA3C79A4EC3D0BB060B0179324B1C596ACEEC3D1769689FE
}
