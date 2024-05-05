// import 'package:blockchain_utils/binary/utils.dart';
// import 'package:blockchain_utils/bip/bip/bip39/bip39_seed_generator.dart';
// import 'package:blockchain_utils/bip/bip/bip44/bip44_base.dart';
// import 'package:blockchain_utils/bip/bip/conf/bip44/bip44_coins.dart';
// import 'package:blockchain_utils/bip/mnemonic/mnemonic.dart';
// import 'package:cosmos_sdk/cosmos_sdk.dart';
// import 'package:example/provider.dart';

// void main() async {
//   final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
//           "this dove indoor skin shed gap east welcome gift buffalo silent high"))
//       .generate();
//   final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.osmosis).deriveDefaultPath;
//   // print("addr ${bip44.publicKey.toAddress}");
//   final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);

//   final publickey = privateKey.toPublicKey();
//   // print(pr.toPublicKey().toAddresss(hrp: "osmo"));

//   final provider = TendermintProvider(
//       TendermintHTTPProvider(url: "https://rpc.testnet.osmosis.zone/"));
//   final b = await provider.request(TendermintRequestAbciQuery(
//       request: OmosisEpochsQueryCurrentEpochRequest("day")));
//   print("b $b");
//   // print("b $b");
//   // return;
//   // return;
//   // final latestBlock = await provider.request(
//   //     TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));
//   // final coinQuery = await provider.request(
//   //     TendermintRequestAbciQuery(request: const QueryDenomsMetadataRequest()));

//   // /// Querying account info from the blockchain
//   // final accountInfo = await provider.request(TendermintRequestAbciQuery(
//   //     request: QueryAccountInfoRequest(publickey.toAddresss(hrp: "osmo"))));

//   // /// Querying the latest block information
//   // final latestBlock = await provider.request(
//   //     TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));

//   // /// Creating authentication info for transaction
//   // final authInfo = AuthInfo(
//   //     signerInfos: [
//   //       SignerInfo(
//   //           publicKey: publickey,
//   //           modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
//   //           sequence: accountInfo.info.sequence)
//   //     ],
//   //     fee: Fee(amount: [
//   //       Coin(
//   //         denom: "uosmo",
//   //         amount: BigInt.from(1000),
//   //       )
//   //     ], gasLimit: BigInt.from(200000)));

//   // /// Creating a transaction message to send tokens
//   // final message = MsgSend(
//   //     fromAddress: publickey.toAddresss(hrp: "osmo"),
//   //     toAddress:
//   //         CosmosBaseAddress("osmo1g5f2d3w3065usfc5fsflafa5jacp090u6pzyx5"),
//   //     amount: [Coin(denom: "uosmo", amount: BigInt.from(8098000))]);

//   // /// Creating transaction body with the message
//   // final txbody = TXBody(messages: [message]);

//   // /// Creating a signable document for the transaction
//   // final SignDoc signDoc = SignDoc(
//   //     bodyBytes: txbody.toBuffer(),
//   //     authInfoBytes: authInfo.toBuffer(),
//   //     chainId: latestBlock.block!.header.chainId,
//   //     accountNumber: accountInfo.info.accountNumber);

//   // /// Signing the document with the private key
//   // final sign = privateKey.sign(signDoc.toBuffer());

//   // /// Creating a raw transaction with body, authentication info, and signature
//   // final txRaw = TxRaw(
//   //     bodyBytes: txbody.toBuffer(),
//   //     authInfoBytes: authInfo.toBuffer(),
//   //     signatures: [sign]);

//   // /// Broadcasting the raw transaction to the network
//   // final r = await provider.request(TendermintRequestBroadcastTxCommit(
//   //     BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));
//   // print("result $r");
// }
void main() {}
