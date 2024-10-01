import 'package:blockchain_utils/utils/utils.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/common/coin.dart';
import 'package:cosmos_sdk/src/models/networks/thorchain/v1/types/types.dart';
import 'package:cosmos_sdk/src/protobuf/protobuf.dart';
import 'package:blockchain_utils/helper/helper.dart';

class ThorchainMsgSolvency extends CosmosMessage {
  final String? id;
  final String? chain;
  final String? pubKey;
  final List<ThorchainCoin> coins;
  final BigInt? height;
  final List<int>? signer;
  ThorchainMsgSolvency({
    this.id,
    this.chain,
    this.pubKey,
    required List<ThorchainCoin> coins,
    this.height,
    List<int>? signer,
  })  : coins = coins.immutable,
        signer = BytesUtils.tryToBytes(signer, unmodifiable: true);
  factory ThorchainMsgSolvency.deserialize(List<int> bytes) {
    final decode = CosmosProtocolBuffer.decode(bytes);
    return ThorchainMsgSolvency(
        id: decode.getField(1),
        chain: decode.getField(2),
        pubKey: decode.getField(3),
        coins: decode
            .getFields(4)
            .map((e) => ThorchainCoin.deserialize(e))
            .toList(),
        height: decode.getField(5),
        signer: decode.getField(6));
  }

  @override
  List<int> get fieldIds => [1, 2, 3, 4, 5, 6];

  @override
  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "chain": chain,
      "pub_key": pubKey,
      "coins": coins.map((e) => e.toJson()).toList(),
      "height": height?.toString(),
      "signer": BytesUtils.tryToHexString(signer)
    };
  }

  @override
  String get typeUrl => ThorchainV1Types.msgSolvency.typeUrl;

  @override
  List get values => [id, chain, pubKey, coins, height, signer];
}
