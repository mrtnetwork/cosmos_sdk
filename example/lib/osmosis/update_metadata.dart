import 'package:blockchain_utils/utils/utils.dart';
import 'package:blockchain_utils/bip/bip/bip39/bip39_seed_generator.dart';
import 'package:blockchain_utils/bip/bip/bip44/bip44_base.dart';
import 'package:blockchain_utils/bip/bip/conf/bip44/bip44_coins.dart';
import 'package:blockchain_utils/bip/mnemonic/mnemonic.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:example/provider.dart';

///  final privateKey2 = CosmosSecp256K1PrivateKey.fromBytes(
///       Bip44.fromSeed(seedBytes, Bip44Coins.osmosis).privateKey.raw);
///   final publickey2 = privateKey2.toPublicKey();

/// osmo1wqzpmju4gl0kcajhjls6ufrqecaedxm9udt80k
void main() async {
  final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
          "this dove indoor skin shed gap east welcome gift buffalo silent high"))
      .generate();
  final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.osmosis).deriveDefaultPath;
  final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);

  final publickey = privateKey.toPublicKey();

  final provider = TendermintProvider(
      TendermintHTTPProvider(url: "https://rpc.testnet.osmosis.zone/"));

  final message = OsmosisTokenFactoryMsgSetDenomMetadata(
    sender: publickey.toAddress(hrp: CosmosAddrConst.osmosis).address,
    metadata: const Metadata(
      description: "TestTone",
      denomUnits: [
        DenomUnit(
          denom:
              "factory/osmo1htg7dmhelazdsmuwm9ngtg0tpe82006ugka49q/MRT", // Base denom
          aliases: ["base MRT"],
          exponent: 0,
        ),
        DenomUnit(
          denom: "MRT", // Human-readable unit
          aliases: ["human-readable MRT"],
          exponent: 2,
        ),
        DenomUnit(
            denom: "MRTNetwork", // Matches display field
            aliases: ["network MRT"],
            exponent: 5),
      ],
      base:
          "factory/osmo1htg7dmhelazdsmuwm9ngtg0tpe82006ugka49q/MRT", // Must match the first denom unit
      display: "MRTNetwork", // Must match a DenomUnit denom
      name: "MRT Token",
      symbol: "MRT",
    ),
  );

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
            publicKey: publickey.toAny(),
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

  /// https://celatone.osmosis.zone/osmo-test-5/txs/0E497A7328B2B2E26388B069CCA77A61338D65C7FD4B9B32B464477DCF1B7A38
}
