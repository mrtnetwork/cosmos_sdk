import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/models.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainMsgTssKeysignFail extends CosmosMessage {
  final String? id;
  final BigInt? height;
  final ThorchainBlame blame;
  final String? memo;
  final List<ThorchainCoin> coins;
  final String? pubKey;
  final List<int>? signer;
  ThorchainMsgTssKeysignFail(
      {this.id,
      this.height,
      required this.blame,
      this.memo,
      required List<ThorchainCoin> coins,
      this.pubKey,
      List<int>? signer})
      : signer = BytesUtils.tryToBytes(signer, unmodifiable: true),
        coins = coins.immutable;
  factory ThorchainMsgTssKeysignFail.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgTssKeysignFail(
        id: decode.getField(1),
        height: decode.getField(2),
        blame: ThorchainBlame.deserialize(decode.getField(3)),
        memo: decode.getField(4),
        coins: decode
            .getFields(5)
            .map((e) => ThorchainCoin.deserialize(e))
            .toList(),
        pubKey: decode.getField(6),
        signer: decode.getField(7));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6, 7];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "height": height.toString(),
      "blame": blame.toJson(),
      "memo": memo,
      "coins": coins.map((e) => e.toJson()).toList(),
      "pub_key": pubKey,
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgTssKeysignFail.typeUrl;

  @override
  List get values => [id, height, blame, memo, coins, pubKey, signer];
}
