import 'package:blockchain_utils/binary/utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'package:example/provider.dart';
import 'package:example/thor_node_provider.dart';

void main() async {
  final privateKey = CosmosSecp256K1PrivateKey.fromHex("");
  final addr = privateKey.toPublicKey().toAddresss(hrp: "thor");
  const String url = "https://thornode.ninerealms.com/thorchain";
  final nodeApi = ThorNodeProvider(ThornodeHTTPProvider(url: url));
  const bnbAddr = "0xcCCdde90083900E8431e0364fa9655bA54A2616c";
  final swapQoute = await nodeApi.request(
    ThorNodeRequestSwapQuote(
        fromAsset: "THOR.RUNE",
        toAsset: "AVAX.AVAX",
        amount: BigInt.from(13000000000),
        streamingInterval: BigInt.from(10),
        streamingQuantity: BigInt.from(10),
        toleranceBps: BigInt.from(100),
        destination: bnbAddr,
        refundAddress: bnbAddr,
        affiliateBps: BigInt.from(100),
        affiliate: "1"),
  );

  final provider = TendermintProvider(
      TendermintHTTPProvider(url: "https://rpc.thorchain.liquify.com/"));
  final dep = ThorchainMsgDeposit(coins: [
    ThorchainCoin(
        asset: const ThorchainAsset(
            chain: "THOR", ticker: "RUNE", symbol: "RUNE", synth: false),
        amount: BigInt.from(137000000))
  ], memo: swapQoute["memo"], signer: addr);
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));
  final accountQuery = await provider
      .request(TendermintRequestAbciQuery(request: QueryAccountRequest(addr)));
  final BaseAccount account = accountQuery.account as BaseAccount;
  final txbody = TXBody(messages: [dep]);
  final authInfo = AuthInfo(signerInfos: [
    SignerInfo(
        publicKey: privateKey.toPublicKey(),
        modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
        sequence: account.sequence)
  ], fee: Fee(amount: [], gasLimit: BigInt.from(600000000)));

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

  await provider.request(TendermintRequestBroadcastTxCommit(
      BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));
}
