import 'package:blockchain_utils/binary/utils.dart';
import 'package:blockchain_utils/bip/bip/bip39/bip39_seed_generator.dart';
import 'package:blockchain_utils/bip/bip/bip44/bip44_base.dart';
import 'package:blockchain_utils/bip/bip/conf/bip44/bip44_coins.dart';
import 'package:blockchain_utils/bip/mnemonic/mnemonic.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'provider.dart';

void main() async {
  final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
          "this dove indoor skin shed gap east welcome gift buffalo silent high"))
      .generate();

  final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.cosmos).deriveDefaultPath;
  final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);
  final pubkey = CosmosSecp256K1PublicKey.fromBytes(bip44.publicKey.compressed);

  const btcAddress = "18o6JzKApaUQ1uJXQhbTUNDsKZRT9hAJuC";
  const String chainName = "BTC";
  const String assetName = "BTC.BTC";
  final BaseAddress owner = pubkey.toAddresss(hrp: "smaya");

  final provider = TendermintProvider(
      TendermintHTTPProvider(url: "http://54.243.15.123:27147/"));
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));
  final accountQuery = await provider.request(TendermintRequestAbciQuery(
      request: QueryAccountRequest(pubkey.toAddresss(hrp: "smaya"))));
  final BaseAccount account = accountQuery.account as BaseAccount;

  final message = ThorchainMsgDeposit.create(
      coins: [
        ThorchainCoin(
            asset: const ThorchainAsset(
                chain: "MAYA", synth: false, ticker: "CACAO", symbol: "CACAO"),
            amount: BigInt.from(50000000000)),
      ],
      chainAddress: btcAddress,
      chainName: chainName,
      chainAsset: assetName,
      name: "MRTNETWORK",
      ownerAddress: owner,
      signer: owner.toBytes());
  final tnsRegisterFeeRune = BigInt.from(10000000000);
  final tnsFeePerBlockRune = BigInt.from(2000);
  final expireBlock = BigInt.from(432000); // avg 1 mount
  final fee = (tnsFeePerBlockRune * expireBlock) + tnsRegisterFeeRune;

  // /// Creating authentication info for transaction
  final authInfo = AuthInfo(
      signerInfos: [
        SignerInfo(
            publicKey: pubkey,
            modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
            sequence: account.sequence)
      ],
      fee: Fee(amount: [
        Coin(
          denom: "cacao",
          amount: fee,
        )
      ], gasLimit: BigInt.from(600000000)));

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

  /// Broadcasting the raw transaction to the network
  await provider.request(TendermintRequestBroadcastTxCommit(
      BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));
}
// https://stagenet.mayascan.org/tx/849D4FAF14193ACFA0998D1E28D1EFB3A2E943C826AB302F8C28E0D4391D20E2