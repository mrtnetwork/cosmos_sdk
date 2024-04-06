import 'package:blockchain_utils/bip/mnemonic/mnemonic.dart';
import 'package:blockchain_utils/blockchain_utils.dart';
import 'package:cosmos_sdk/cosmos_sdk.dart';
import 'provider.dart';

void main() async {
  /// Generating BIP39 seed from mnemonic phrase
  final seedBytes = Bip39SeedGenerator(Mnemonic.fromString(
          "this dove indoor skin shed gap east welcome gift buffalo silent high"))
      .generate();

  /// Deriving hierarchical deterministic (HD) wallet using BIP44
  final bip44 = Bip44.fromSeed(seedBytes, Bip44Coins.cosmos).deriveDefaultPath;
  final pubkey = CosmosSecp256K1PublicKey.fromBytes(bip44.publicKey.compressed);
  final privateKey = CosmosSecp256K1PrivateKey.fromBytes(bip44.privateKey.raw);

// Initializing provider to interact with Tendermint node of Theta testnet
  final provider = TendermintProvider(TendermintHTTPProvider(
      url: "https://rpc.sentry-02.theta-testnet.polypore.xyz"));

  /// Querying account info from the blockchain
  final accountInfo = await provider.request(TendermintRequestAbciQuery(
      request: QueryAccountInfoRequest(pubkey.toAddresss())));

  /// Querying the latest block information
  final latestBlock = await provider.request(
      TendermintRequestAbciQuery(request: const GetLatestBlockRequest()));

  /// Creating authentication info for transaction
  final authInfo = AuthInfo(
      signerInfos: [
        SignerInfo(
            publicKey: pubkey,
            modeInfo: const ModeInfo(ModeInfoSignle(SignMode.signModeDirect)),
            sequence: accountInfo.info.sequence)
      ],
      fee: Fee(amount: [
        Coin(
          denom: "uatom",
          amount: BigInt.from(1000),
        )
      ], gasLimit: BigInt.from(200000)));

  /// Creating a transaction message to send tokens
  final message = MsgSend(
      fromAddress: pubkey.toAddresss(),
      toAddress: BaseAddress("cosmos1qhslf0sx2fegltfqq0p5j6etmdznjgfnm2j6nc"),
      amount: [Coin(denom: "uatom", amount: BigInt.from(1000000))]);

  /// Creating transaction body with the message
  final txbody = TXBody(messages: [message]);

  /// Creating a signable document for the transaction
  final SignDoc signDoc = SignDoc(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      chainId: latestBlock.block!.header.chainId,
      accountNumber: accountInfo.info.accountNumber);

  /// Signing the document with the private key
  final sign = privateKey.sign(signDoc.toBuffer());

  /// Creating a raw transaction with body, authentication info, and signature
  final txRaw = TxRaw(
      bodyBytes: txbody.toBuffer(),
      authInfoBytes: authInfo.toBuffer(),
      signatures: [sign]);

  /// Broadcasting the raw transaction to the network
  await provider.request(TendermintRequestBroadcastTxCommit(
      BytesUtils.toHexString(txRaw.toBuffer(), prefix: "0x")));

  /// https://explorer.polypore.xyz/theta-testnet-001/tx/C4F8651D893131E490A4EB76A06D75BC50964FDAAE9030235517571F6104FB62
}
