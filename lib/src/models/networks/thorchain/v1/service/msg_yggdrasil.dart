import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:cosmos_sdk/src/utils/quick_extensions.dart';

class ThorchainMsgYggdrasil extends CosmosMessage {
  final ThorchainTx tx;
  final String? pubKey;
  final bool? addFunds;
  final List<ThorchainCoin> coins;
  final BigInt? blockHeight;
  final List<int>? signer;
  ThorchainMsgYggdrasil(
      {required this.tx,
      this.pubKey,
      this.addFunds,
      required List<ThorchainCoin> coins,
      this.blockHeight,
      List<int>? signer})
      : coins = coins.immutable,
        signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgYggdrasil.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgYggdrasil(
        tx: ThorchainTx.deserialize(decode.getField(1)),
        pubKey: decode.getField(2),
        addFunds: decode.getField(3),
        coins: decode
            .getFields(4)
            .map((e) => ThorchainCoin.deserialize(e))
            .toList(),
        blockHeight: decode.getField(5),
        signer: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "tx": tx.toJson(),
      "pub_key": pubKey,
      "add_funds": addFunds,
      "coins": coins.map((e) => e.toJson()).toList(),
      "block_height": blockHeight?.toString(),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgYggdrasil.typeUrl;

  @override
  List get values => [tx, pubKey, addFunds, coins, blockHeight, signer];
}
