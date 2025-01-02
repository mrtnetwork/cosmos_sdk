import 'package:blockchain_utils/utils/utils.dart';
import 'package:blockchain_utils/bip/bip/bip39/bip39_seed_generator.dart';
import 'package:blockchain_utils/bip/bip/bip44/bip44_base.dart';
import 'package:blockchain_utils/bip/bip/conf/bip44/bip44_coins.dart';
import 'package:blockchain_utils/bip/mnemonic/mnemonic.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:example/provider.dart';

void main() async {
  final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
          "this dove indoor skin shed gap east welcome gift buffalo silent high"))
      .generate();
  final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.osmosis).deriveDefaultPath;
  final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);

  final publickey = privateKey.toPublicKey();

  final provider = TendermintProvider(
      TendermintHTTPProvider(url: "https://rpc.testnet.osmosis.zone/"));

  final message = OsmosisTokenFactoryMsgCreateDenom(
      sender: publickey.toAddress(hrp: CosmosAddrConst.osmosis).address,
      subdenom: "MRT");

  /// Querying account info from the blockchain
  final accountInfo = await provider.request(TendermintRequestAbciQuery(
      request: QueryAccountInfoRequest(
          publickey.toAddress(hrp: CosmosAddrConst.osmosis))));

  /// Querying the latest block information
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));

  /// Creating authentication info for transaction
  final authInfo = AuthInfo(
      signerInfos: [
        SignerInfo(
            publicKey: publickey,
            modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
            sequence: accountInfo.info.sequence)
      ],
      fee: Fee(amount: [
        Coin(
          denom: "uosmo",
          amount: BigInt.from(1000000),
        )
      ], gasLimit: BigInt.from(2000000)));

  final txbody = TXBody(messages: [message]);

  /// Creating a signable document for the transaction
  final SignDoc signDoc = SignDoc(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      chainId: latestBlock.block!.header.chainId,
      accountNumber: accountInfo.info.accountNumber);

  final sign = privateKey.sign(signDoc.toBuffer());

  final txRaw = TxRaw(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      signatures: [sign]);

  await provider.request(TendermintRequestBroadcastTxCommit(
      BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));

  /// https://celatone.osmosis.zone/osmo-test-5/txs/710730140C2054BC7E626CD80088DE46A23CA45C795B830E81609A28699F4F12
}
