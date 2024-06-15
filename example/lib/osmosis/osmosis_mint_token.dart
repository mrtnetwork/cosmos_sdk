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
  // print("addr ${bip44.publicKey.toAddress}");
  final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);

  final publickey = privateKey.toPublicKey();
  // print(pr.toPublicKey().toAddresss(hrp: "osmo"));

  final provider = TendermintProvider(
      TendermintHTTPProvider(url: "https://rpc.testnet.osmosis.zone/"));

  final message = OsmosisTokenFactoryMsgMint(
      sender: publickey.toAddresss(hrp: CosmosAddrConst.osmosis).address,
      amount: Coin(
          denom: "factory/osmo1htg7dmhelazdsmuwm9ngtg0tpe82006ugka49q/MRT",
          amount: BigInt.from(123123123123123)));

  /// Querying account info from the blockchain
  final accountInfo = await provider.request(TendermintRequestAbciQuery(
      request: QueryAccountInfoRequest(
          publickey.toAddresss(hrp: CosmosAddrConst.osmosis))));

  /// Querying the latest block information
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));

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
          amount: BigInt.from(100000),
        )
      ], gasLimit: BigInt.from(2000000)));

  final txbody = TXBody(messages: [message]);

  /// Creating a signable document for the transaction
  final SignDoc signDoc = SignDoc(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      chainId: latestBlock.block!.header.chainId,
      accountNumber: accountInfo.info.accountNumber);

  /// Signing the document with the private key
  final sign = privateKey.sign(signDoc.toBuffer());

  final txRaw = TxRaw(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      signatures: [sign]);

  await provider.request(TendermintRequestBroadcastTxCommit(
      BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));

  /// https://celatone.osmosis.zone/osmo-test-5/txs/B7F3780394D5E0530F0B14293B4406D3051E38F2D9B05B45EE6FD3230E05B50A
}
