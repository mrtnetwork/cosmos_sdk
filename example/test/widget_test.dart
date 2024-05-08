// import 'package:blockchain_utils/binary/utils.dart';
// import 'package:blockchain_utils/bip/bip/bip39/bip39_seed_generator.dart';
// import 'package:blockchain_utils/bip/bip/bip44/bip44_base.dart';
// import 'package:blockchain_utils/bip/bip/conf/bip44/bip44_coins.dart';
// import 'package:blockchain_utils/bip/mnemonic/mnemonic.dart';
// import 'package:cosmos_sdk/cosmos_sdk.dart';
// import 'package:example/provider.dart';

// ///  final privateKey2 = CosmosSecp256K1PrivateKey.fromBytes(
// ///       Bip44.fromSeed(seedBytes, Bip44Coins.osmosis).privateKey.raw);
// ///   final publickey2 = privateKey2.toPublicKey();

// /// osmo1wqzpmju4gl0kcajhjls6ufrqecaedxm9udt80k
// void main() async {
//   final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
//           "this dove indoor skin shed gap east welcome gift buffalo silent high"))
//       .generate();
//   final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.osmosis).deriveDefaultPath;

//   final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);

//   final publickey = privateKey.toPublicKey();
//   // print(pr.toPublicKey().toAddresss(hrp: "osmo"));

//   // final provider = TendermintProvider(
//   //     TendermintHTTPProvider(url: "https://lcd.osmotest5.osmosis.zone/"));
//   final provider = TendermintProvider(
//       TendermintHTTPProvider(url: "https://rpc.testnet.osmosis.zone/"));
//   final message = OsmosisValSetprefMsgDelegateToValidatorSet(
//       delegator: publickey.toAddresss(hrp: CosmosAddrConst.osmosis).address,
//       coin: Coin(denom: "uosmo", amount: BigInt.from(10000000)));

//   /// Querying account info from the blockchain
//   final accountInfo = await provider.request(TendermintRequestAbciQuery(
//       request: QueryAccountInfoRequest(
//           publickey.toAddresss(hrp: CosmosAddrConst.osmosis))));

//   /// Querying the latest block information
//   final latestBlock = await provider.request(
//       TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));

//   final accountBalances = await provider.request(TendermintRequestAbciQuery(
//       request: OsmosisConcentratedLiquidityPoolsRequest()));
//   print(accountBalances.pools?.map((e) => e.typeUrl).toList().toSet());
//   return;
//   // /// OsmosisGammQueryPoolsRequest
//   // print("balances $accountBalances");
//   // return;

//   /// Creating authentication info for transaction
//   final authInfo = AuthInfo(
//       signerInfos: [
//         SignerInfo(
//             publicKey: publickey,
//             modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
//             sequence: accountInfo.info.sequence)
//       ],
//       fee: Fee(amount: [
//         Coin(
//           denom: "uosmo",
//           amount: BigInt.from(100000),
//         )
//       ], gasLimit: BigInt.from(2000000)));

//   final txbody = TXBody(messages: [message]);

//   /// Creating a signable document for the transaction
//   final SignDoc signDoc = SignDoc(
//       bodyBytes: txbody.toBuffer(),
//       authInfoBytes: authInfo.toBuffer(),
//       chainId: latestBlock.block!.header.chainId,
//       accountNumber: accountInfo.info.accountNumber);

//   /// Signing the document with the private key
//   final sign = privateKey.sign(signDoc.toBuffer());

//   final txRaw = TxRaw(
//       bodyBytes: txbody.toBuffer(),
//       authInfoBytes: authInfo.toBuffer(),
//       signatures: [sign]);

//   final txForSimulate =
//       Tx(body: txbody, authInfo: authInfo, signatures: [sign]);

//   final simulateRequest = await provider.request(TendermintRequestAbciQuery(
//       request: SimulateRequest(txForSimulate.toBuffer())));
//   print("simulate $simulateRequest");
//   // final resp = await provider.request(TendermintRequestBroadcastTxCommit(
//   //     BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));
//   // print("resp $resp");

//   /// https://celatone.osmosis.zone/osmo-test-5/txs/7C66B231A02BE52E2E42127A6BAAC35C24AEC35519E3FED4545982BEE781EBA8
// }
